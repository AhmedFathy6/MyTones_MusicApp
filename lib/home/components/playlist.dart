import 'package:flutter/material.dart';
import 'package:my_tones/home/components/song_item.dart';
import 'package:my_tones/model/music_model.dart';
import 'package:my_tones/shared/cubit/cubit.dart';

class PlayList extends StatelessWidget {
  const PlayList({
    Key? key,
    required this.cubit,
  }) : super(key: key);

  final MusicPlayerCubit cubit;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) => CustomSong(
            song: songs[index],
            onTap: () async => await cubit.playMusic(songs[index]),
          ),
          itemCount: songs.length,
        ),
      ),
    );
  }
}
