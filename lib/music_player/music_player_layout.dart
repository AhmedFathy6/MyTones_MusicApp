import 'package:flutter/material.dart';
import 'package:my_tones/music_player/components/player_data_layout.dart';
import 'package:my_tones/music_player/components/player_slider.dart';
import 'package:my_tones/music_player/components/player_timer.dart';
import 'package:my_tones/shared/cubit/cubit.dart';

class MusicPlayerLayout extends StatelessWidget {
  const MusicPlayerLayout({
    Key? key,
    required this.cubit,
  }) : super(key: key);

  final MusicPlayerCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(
              0x55212121,
            ),
            blurRadius: 8,
          ),
        ],
      ),
      child: Column(
        children: [
          CustomPlayerSlider(cubit: cubit),
          PlayerTimer(cubit: cubit),
          const SizedBox(
            height: 10.0,
          ),
          SongDataLayout(cubit: cubit),
        ],
      ),
    );
  }
}
