import 'package:flutter/material.dart';
import 'package:my_tones/shared/cubit/cubit.dart';

class SongCover extends StatelessWidget {
  const SongCover({
    Key? key,
    required this.cubit,
  }) : super(key: key);

  final MusicPlayerCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      width: 60.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          16,
        ),
        image: DecorationImage(
          image: NetworkImage(
            cubit.currentSong.coverUrl,
          ),
        ),
      ),
    );
  }
}
