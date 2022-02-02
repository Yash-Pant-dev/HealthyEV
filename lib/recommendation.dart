import 'package:flutter/material.dart';

class Recommendation extends StatefulWidget {
  Recommendation({Key? key}) : super(key: key);

  @override
  State<Recommendation> createState() => _RecommendationState();
}

class _RecommendationState extends State<Recommendation> {
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
