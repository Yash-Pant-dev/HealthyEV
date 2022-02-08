import 'package:flutter/material.dart';

class Caution extends StatefulWidget {
  Caution({Key? key}) : super(key: key);

  @override
  State<Caution> createState() => _CautionState();
}

class _CautionState extends State<Caution> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // add second screen here
      appBar: AppBar(
        title: Text('Recommendations'),
      ),
      body: Container(child: Text('data')),
      
    );
  }
}
