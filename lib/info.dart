import 'dart:ui';

import 'package:battery_health_monitor/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  // Future<SharedPreferences> prefs
  void saveData(int a, String? val) async {
    final pref = await SharedPreferences.getInstance();
    if (a == 1) {
      pref.setString('year', val!);
      infoMap['BCAP'] = val;
    }
    if (a == 0) {
      pref.setString('bevname', val!);
      infoMap['BEVname'] = val;
    }
    if (a == 2) {
      print("2:" + infoMap['BEVname']);
      print(pref.getString('year'));
    }
  }

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
                          saveData(0, val);
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
                        decoration: const InputDecoration(
                            labelText: 'Battery Capacity(in KWh)'),
                        onSaved: (String? val) {
                          // TODO: Save to shared_pref
                          saveData(1, val);
                        },
                        validator: (String? val) {
                          if (val!.isEmpty) {
                            return 'Kindly input the battery capacity';
                          }
                          return null;
                        },
                      ),
                      RaisedButton(
                        child: const Text('Submit'),
                        onPressed: () {
                          if (_infokey.currentState!.validate()) {
                            _infokey.currentState!.save();
                            saveData(2, "");
                            setState(() {
                              batteryName = infoMap['BEVname'];
                            });                                                  

                            Navigator.pop<String>(context, batteryName);
                          }
                        },
                      )
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
