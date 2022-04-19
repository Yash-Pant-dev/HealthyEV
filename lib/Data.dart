import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'caution.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class Data extends StatefulWidget {
  Data({Key? key}) : super(key: key);

  @override
  State<Data> createState() => _DataState();
}

var _value = 5.0;
var _value2 = 5.0;
var _fst = false;
var _fst2 = false;

Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();
  print('Path:${directory.path}');
  return directory.path;
}

Future<File> get _localFile async {
  final path = await _localPath;
  print('PATH:$path');
  return File('$path/newdata.json');
}

class _DataState extends State<Data> {
  GlobalKey<FormState> _dataKey = GlobalKey<FormState>();

  Map<String, dynamic> dataMap = <String, dynamic>{
    'time': "",
    'maxsoc': "",
    'minsoc': "",
    'chargebw': "", //if charged in b/w yes/no
    'temp': "",
    'dist': "" //Battery Capacity
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: ,
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 55.0),
            child: Material(
              elevation: 10,
              child: Text(
                'Add Trip Data',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
            child: Form(
              key: _dataKey,
              child: Column(
                children: [
                  const Padding(
                    padding: const EdgeInsets.only(top: 50),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Duration of trip ',
                      hintText: 'Enter the duration of trip in minutes',
                      icon: Icon(Icons.battery_charging_full),
                    ),
                    onSaved: (String? val) {
                      dataMap['time'] = val;
                    },
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 20),
                  ),
                  const Text('SOC before trip'),
                  Slider(
                    label: _value.toString(),
                    min: 0,
                    max: 100,
                    divisions: 10,
                    value: _value,
                    onChanged: (double val) => {
                      setState(() {
                        _value = val;
                        dataMap['maxsoc'] = val.toString();
                      }),
                    },
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 20),
                  ),
                  const Text('SOC after trip'),
                  Slider(
                    label: _value2.toString(),
                    min: 0,
                    max: 100,
                    divisions: 10,
                    value: _value2,
                    onChanged: (double val) => {
                      setState(() {
                        _value2 = val;
                        dataMap['minsoc'] = val.toString();
                      })
                    },
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20, left: 15, bottom: 20),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Distance of trip ',
                        hintText: 'Enter the distance of trip in Km',
                        suffixIcon: const Icon(Icons.add_road_rounded),
                        // icon: Icon(Icons.battery_charging_full),
                      ),
                      onSaved: (String? val) {
                        dataMap['dist'] = val;
                      },
                    ),
                  ),
                  Row(
                    children: [
                      Switch(
                        value: _fst,
                        // value: false,
                        onChanged: (bool val) => setState(
                          () {
                            _fst = val;
                            dataMap['chargebw'] = val.toString();
                          },
                        ),
                      ),
                      const Text('Fast charging')
                    ],
                  ),
                  Row(
                    children: [
                      Switch(
                        value: _fst2,
                        // value: false,
                        onChanged: (bool val) => setState(
                          () {
                            _fst2 = val;
                            dataMap['temp'] = val.toString();
                          },
                        ),
                      ),
                      const Text(
                          'Ambient Operating Temperature over 30 degrees\n Celsius')
                    ],
                    // ],
                    // ],
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      File file = await _localFile;

                      file.writeAsString(jsonEncode(dataMap));
                      print("lala:");
                      print(await file.readAsString());

                      Navigator.pop(context, dataMap);
                    },
                    child: const Text('Submit Data'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
