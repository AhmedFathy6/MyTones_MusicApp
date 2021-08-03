import 'package:flutter/material.dart';
import 'package:my_tones/shared/cubit/cubit.dart';
import 'package:my_tones/shared/public_functions.dart';

class PlayerTimer extends StatelessWidget {
  const PlayerTimer({
    Key? key,
    required this.cubit,
  }) : super(key: key);

  final MusicPlayerCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0, left: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(printDuration(cubit.position!)),
          Text(
            printDuration(cubit.duration!),
          ),
        ],
      ),
    );
  }
}
