import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';

final getIt = GetIt.instance;

class BaDumTss {
  final AudioPlayer _audioPlayer = AudioPlayer();
  AudioPlayer get audioPlayer => _audioPlayer;
}

void setUp() {
  getIt.registerFactory(() => BaDumTss());
}

Future<void> databaseInit(Directory directory) async {
  Hive.init(directory.path);
  await Hive.openBox<String>('myBox');
  Box box = Hive.box<String>('myBox');
  if (box.get('playedOnce') == null) {
    box.put(
      'playedOnce',
      'false',
    );
  }
}
