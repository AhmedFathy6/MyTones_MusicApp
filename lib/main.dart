import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:my_tones/home/setup.dart';
import 'package:my_tones/home/start.dart';
import 'package:my_tones/shared/cubit/bloc_observer.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setUp();
  Directory directory = await getApplicationDocumentsDirectory();
  await databaseInit(directory);
  Bloc.observer = MyBlocObserver();
  runApp(const MainApp());
}
