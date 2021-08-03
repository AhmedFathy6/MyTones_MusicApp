import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_tones/home/components/playlist.dart';
import 'package:my_tones/music_player/music_player_layout.dart';
import 'package:my_tones/shared/cubit/cubit.dart';
import 'package:my_tones/shared/cubit/states.dart';

class MusicPlayerScreen extends StatefulWidget {
  const MusicPlayerScreen({Key? key}) : super(key: key);

  @override
  State<MusicPlayerScreen> createState() => _MusicPlayerScreenState();
}

class _MusicPlayerScreenState extends State<MusicPlayerScreen>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
    MusicPlayerCubit.get(context).musicPlayerInit();
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Tones"),
      ),
      body: BlocConsumer<MusicPlayerCubit, MusicPlayerStates>(
        listener: (context, state) {},
        builder: (context, state) {
          MusicPlayerCubit cubit = MusicPlayerCubit.get(context);
          return Column(
            children: [
              PlayList(cubit: cubit),
              MusicPlayerLayout(cubit: cubit),
            ],
          );
        },
      ),
    );
  }
}
