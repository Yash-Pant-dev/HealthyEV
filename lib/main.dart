import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Fixed Tabs'),
            automaticallyImplyLeading: false,
            backgroundColor: const Color(0xff5808e5),
            bottom: const TabBar(
              indicatorColor: Colors.white,
              tabs: [
                Tab(text: 'DOGS', icon: Icon(Icons.favorite)),
                Tab(text: 'CATS', icon: Icon(Icons.music_note)),
                Tab(text: 'BIRDS', icon: Icon(Icons.search)),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              Center(child: Text('DOGS')),
              Center(child: Text('CATS')),
              Center(child: Text('BIRDS')),
            ],
          ),
        ),
      ),
    );
  }
}
