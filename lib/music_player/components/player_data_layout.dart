import 'package:flutter/material.dart';
import 'package:my_tones/music_player/components/player_data.dart';
import 'package:my_tones/music_player/components/song_cover.dart';
import 'package:my_tones/shared/cubit/cubit.dart';

class SongDataLayout extends StatelessWidget {
  const SongDataLayout({
    Key? key,
    required this.cubit,
  }) : super(key: key);

  final MusicPlayerCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          SongCover(cubit: cubit),
          const SizedBox(
            width: 10,
          ),
          PlayerData(cubit: cubit),
        ],
      ),
    );
  }
}
