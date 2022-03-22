import 'dart:ui';

import 'package:flutter/material.dart';

class Info extends StatefulWidget {
  Info({Key? key}) : super(key: key);

  @override
  State<Info> createState() => _InfoState();
}

class _InfoState extends State<Info> {
  GlobalKey<FormState> _infokey = GlobalKey<FormState>();

  Map<String, dynamic> infoMap = <String, dynamic>{
    'BEVName': "",
    // 'Make': "",
    // 'Year Purchased': "",
    'BCAP': "" //Battery Capacity
  };

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
              const Padding(padding: EdgeInsets.all(20)),
              Center(
                child: Hero(
                  tag: 'batteryIcon',
                  child: Image.asset(
                    'assets/carbattery.png',
                    scale: 5,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const Center(
                child: Text(
                  'Info',
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              ),
              Form(
                key: _infokey,
                child: Container(
                  child: Column(
                    children: [
                      TextFormField(
                        initialValue: infoMap['BEVName'],
                        decoration: InputDecoration(labelText: 'Vehicle Name'),
                        onSaved: (String? val) {
                          // TODO: Save to shared_pref
                        },
                        validator: (String? val) {
                          if (val!.isEmpty) {
                            return 'Kindly input the vehicle name';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        initialValue: infoMap['BCAP'],
                        decoration: InputDecoration(labelText: 'Battery Capacity'),
                        onSaved: (String? val) {
                          // TODO: Save to shared_pref
                        },
                        validator: (String? val) {
                          if (val!.isEmpty) {
                            return 'Kindly input the battery capacity';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
