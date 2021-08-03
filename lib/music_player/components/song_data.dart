import 'package:flutter/material.dart';
import 'package:my_tones/shared/cubit/cubit.dart';

class SongData extends StatelessWidget {
  const SongData({
    Key? key,
    required this.cubit,
  }) : super(key: key);

  final MusicPlayerCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          cubit.currentSong.title,
          style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          height: 5.0,
        ),
        Text(
          cubit.currentSong.singer,
          style: const TextStyle(
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
