import 'dart:ui';
import 'homepage.dart';
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
    // 'BEVName': "",              //initializing this with empty string is overwriting new values entered just before submitting
    // 'Make': "",
    // 'Year Purchased': "",
    // 'BCAP': "" //Battery Capacity
  };
 
  // Future<SharedPreferences> prefs
  void saveData(int a, String? val) async {
    final pref = await SharedPreferences.getInstance();
    if (a == 1) {
      pref.setString('cap', val!);
      infoMap['BCAP'] = val;
    }
    if (a == 3) {
      pref.setString('year', val!);
      infoMap['year'] = val;
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
  
  // getData
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
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: TextFormField(
                          initialValue: '',
                          decoration: InputDecoration(labelText: 'Vehicle Name', suffixIcon: Icon(Icons.local_car_wash_rounded)),
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
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: TextFormField(
                          initialValue: '',
                          decoration: InputDecoration(labelText: 'Purchase Year', suffixIcon: Icon(Icons.timelapse_sharp)),
                          onSaved: (String? val) {
                            // TODO: Save to shared_pref
                            saveData(3, val);
                          },
                          validator: (String? val) {
                            if (val!.isEmpty) {
                              return 'Kindly input the year of purchase ';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: TextFormField(
                          initialValue: infoMap['BCAP'],
                          decoration: const InputDecoration(
                              labelText: 'Battery Capacity(in KWh)',suffixIcon: Icon(Icons.battery_full)),
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
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: ElevatedButton(
                          // style: decoratio,
                          child: const Text('Submit'),
                          onPressed: () {
                            if (_infokey.currentState!.validate()) {
                              _infokey.currentState!.save();
                              saveData(2, "");
                              //  argument
                              print("sv2->"+infoMap['BEVname']);
                              Navigator.pop(context, infoMap);
                            }
                          },
                        ),
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
