// ignore_for_file: use_key_in_widget_constructors
import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'warningcard.dart';
// import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'By Yash Pant',
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/caution': (context) => WarningCard(),
      },
    );
  }
}














//TODO: Add toast/snackbar when data updates
// checkout emoji_transportation_rounded as icon