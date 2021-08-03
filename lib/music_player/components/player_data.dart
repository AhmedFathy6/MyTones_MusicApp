import 'package:flutter/material.dart';
import 'package:my_tones/music_player/components/song_data.dart';
import 'package:my_tones/shared/cubit/cubit.dart';

class PlayerData extends StatelessWidget {
  const PlayerData({
    Key? key,
    required this.cubit,
  }) : super(key: key);

  final MusicPlayerCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SongData(cubit: cubit),
          const SizedBox(
            width: 5.0,
          ),
          IconButton(
            icon: Icon(
              cubit.btnIcon,
              size: 42,
            ),
            onPressed: () => cubit.runMusic(),
          ),
        ],
      ),
    );
  }
}
