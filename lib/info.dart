import 'dart:ui';

import 'package:flutter/material.dart';

class Info extends StatefulWidget {
  Info({Key? key}) : super(key: key);

  @override
  State<Info> createState() => _InfoState();
}

class _InfoState extends State<Info> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: const Text('Info'),
        // ),
        body: Container(
          child: SingleChildScrollView(
            reverse: true,
            child: Column(
              children: [
                Padding(padding: EdgeInsets.all(20)),
                Center(
                  child: Hero(
                    tag: 'batteryIcon',
                    child: Image.asset('assets/carbattery.png' ,scale: 5,fit: BoxFit.contain,),
                  ),
                ),
                const Center(
                  child: Text('Info', style: TextStyle(fontSize: 25,),),
                ),
                const TextField( style: TextStyle(color:Colors.purple),),
                const TextField( style: TextStyle(color:Colors.purple),),
                const TextField( style: TextStyle(color:Colors.purple),),
                const TextField( style: TextStyle(color:Colors.purple),),
              ],
            ),
          ),
        ));
  }
}
