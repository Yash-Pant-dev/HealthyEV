import 'package:flutter/material.dart';

class WarningCard extends StatefulWidget {
  WarningCard({Key? key}) : super(key: key);

  @override
  State<WarningCard> createState() => _WarningCardState();
}

class _WarningCardState extends State<WarningCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // add second screen here
      appBar: AppBar(
        title: Text('Recommendations'),
      ),
      body: Container(child: Text('data')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {Navigator.pop(context)},
        child: Text('return'),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
