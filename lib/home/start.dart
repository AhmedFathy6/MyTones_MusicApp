import 'package:flutter/material.dart';
import 'package:my_tones/home/music_player_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:my_tones/shared/cubit/cubit.dart';

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MusicPlayerCubit()..musicPlayerInit(),
      child: MaterialApp(
        title: 'My Tones',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: const MusicPlayerScreen(),
      ),
    );
  }
}
