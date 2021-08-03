import 'package:flutter/material.dart';
import 'package:my_tones/shared/cubit/cubit.dart';

class CustomPlayerSlider extends StatelessWidget {
  const CustomPlayerSlider({
    Key? key,
    required this.cubit,
  }) : super(key: key);

  final MusicPlayerCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Slider.adaptive(
      value: cubit.position!.inSeconds.toDouble(),
      min: 0,
      max: cubit.duration!.inSeconds.toDouble(),
      onChanged: (value) => cubit.seekToSecond(value.toInt()),
    );
  }
}
