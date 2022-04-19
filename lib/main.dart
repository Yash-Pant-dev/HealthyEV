// ignore_for_file: use_key_in_widget_constructors
import 'dart:io';

import 'package:flutter/material.dart';
import 'homepage.dart';
import 'caution.dart';
import 'info.dart';
import 'Data.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'dart:async';
import 'recalibrate.dart';
// import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
  Future.delayed(Duration(seconds: 5),
      () => {FlutterNativeSplash.removeAfter(initialization)});
}

void initialization(BuildContext ctx) {
  // sleep(Duration(seconds: 2));
  print('Splash screen finished');
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HealthyEV by Yash Pant',
      initialRoute: '/home',
      routes: {
        '/home': (context) => HomePage(),
        '/caution': (context) => Caution(),
        '/info': (context) => Info(),
        '/data':(context) => Data(),
        '/recalibrate':(context) => Recalibrate(),
      },
    );
  }
}

//TODO: Add toast/snackbar when data updates
// checkout emoji_transportation_rounded as icon