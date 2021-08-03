import 'package:audioplayers/audioplayers.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:my_tones/home/setup.dart';
import 'package:my_tones/model/music_model.dart';
import 'package:my_tones/shared/cubit/states.dart';

class MusicPlayerCubit extends Cubit<MusicPlayerStates> {
  MusicPlayerCubit() : super(MusicPlayerInitialState());
  static MusicPlayerCubit get(context) => BlocProvider.of(context);
  Duration? duration;
  Duration? position;
  bool isPlaying = false;
  IconData btnIcon = Icons.play_arrow;
  BaDumTss? instance;
  AudioPlayer? audioPlayer;
  Box box = Hive.box<String>('myBox');
  Song currentSong = Song(
    title: '',
    singer: '',
    url: '',
    coverUrl: '',
  );

  Future<void> playMusic(Song song) async {
    if (isPlaying && currentSong.url != song.url) {
      audioPlayer!.pause();
      int result = await audioPlayer!.play(song.url);
      if (result == 1) {
        isPlaying = true;
        currentSong = song;
        emit(PlayState());
      }
    } else if (!isPlaying) {
      int result = await audioPlayer!.play(song.url);
      if (result == 1) {
        isPlaying = true;
        currentSong = song;
        btnIcon = Icons.play_arrow;
        emit(PlayState());
      }
    }
    _updateCurrentSong();
    getTime(song);
  }

  void getTime(Song song) {
    audioPlayer!.onDurationChanged.listen(
      (event) {
        duration = event;
        emit(ListenDurationState());
      },
    );
    audioPlayer!.onAudioPositionChanged.listen(
      (event) {
        position = event;
        emit(ListenPositionState());
        //playNextSong(song);
      },
    );
  }

  void musicPlayerInit() {
    instance = getIt<BaDumTss>();
    audioPlayer = instance!.audioPlayer;
    duration = const Duration();
    position = const Duration();
    if (box.get('playedOnce') == 'false') {
      currentSong.coverUrl =
          'https://i.pinimg.com/originals/25/0c/e1/250ce1e27b85c49afd1c745d8cb02ffa.png';
      currentSong.title = 'Choose a song to play';
      emit(MusicPlayerInitialState());
    } else if (box.get('playedOnce') == "true") {
      // If user is opening the app second or third time and he has already played a song
      currentSong.coverUrl = box.get('currentCover');
      currentSong.singer = box.get('currentSinger');
      currentSong.title = box.get('currentTitle');
      currentSong.url = box.get('url');
    }
  }

  void seekToSecond(int second) {
    audioPlayer!.seek(Duration(seconds: second));
  }

  void _updateCurrentSong() {
    box.put('playedOnce', 'true');
    box.put('currentCover', currentSong.coverUrl);
    box.put('currentTitle', currentSong.title);
    box.put('currentSinger', currentSong.singer);
    box.put('url', currentSong.url);
  }

  void runMusic() {
    if (box.get('playedOnce') == 'true' && !isPlaying) {
      playMusic(currentSong);
    } else {
      if (isPlaying) {
        audioPlayer!.pause();
        btnIcon = Icons.pause;
        isPlaying = false;
        emit(PauseState());
      } else {
        audioPlayer!.resume();
        btnIcon = Icons.play_arrow;
        emit(ResumeState());
      }
    }
  }

  void playNextSong(Song song) async {
    if ((position!.inSeconds - duration!.inSeconds) < 2 &&
        duration!.inSeconds != 0) {
      Song nextSong;
      int currentIndex = songs.indexWhere((element) => song.url == element.url);
      if (currentIndex == songs.length) {
        nextSong = songs[0];
      } else {
        nextSong = songs[currentIndex + 1];
      }
      await playMusic(nextSong);
    }
  }
}
