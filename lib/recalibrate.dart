import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'caution.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'globals.dart' as globals;

class Recalibrate extends StatefulWidget {
  Recalibrate({Key? key}) : super(key: key);

  @override
  State<Recalibrate> createState() => _RecalibrateState();
}

Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();
  print('Path:${directory.path}');
  return directory.path;
}

Future<File> get _tripdata async {
  final path = await _localPath;
  print('PATH:$path');
  return File('$path/newdata.json');
}

Future<File> get _localFile async {
  final path = await _localPath;
  print('PATH:$path');
  return File('$path/counter.json');
}

// var recal;

class _RecalibrateState extends State<Recalibrate> {
  GlobalKey<FormState> _recalibrateKey = GlobalKey<FormState>();
  Map<String, dynamic> recalibrateMap = <String, dynamic>{};
  List recalList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                top: 48.0, left: 32, right: 32, bottom: 16),
            child: Material(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              color: Colors.blueGrey,
              elevation: 30,
              child: Container(
                margin: const EdgeInsets.only(top: 15, bottom: 15),
                child: const Center(
                  child: Text(
                    'Recalibrate Data',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                    
                  ),
                ),
              ),
            ),
          ),
          Form(
            child: Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 15.0, left: 15, right: 15, bottom: 8),
                    child: Form(
                      key: _recalibrateKey,
                      child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Enter JSON Data here',
                          hintText: 'Enter data in JSON format',
                          suffixIcon: Icon(Icons.data_object_sharp),
                        ),
                        onSaved: (value) {
                          // recal = value;
                          recalList.addAll(jsonDecode(value!));
                          // print(recalList);
                        },
                        validator: (String? val) {
                          if (val == null || val.isEmpty) {
                            return 'Please enter data';
                          }
                          try {
                            var json = jsonDecode(val);
                            if (json is! List) {
                              return 'Please enter data in array of JSON object(s) format';
                            }
                            if (val == "[]") {
                              return 'Please enter non-empty data in array of JSON object(s) format';
                            }
                          } catch (e) {
                            return 'Data format is invalid';
                          }

                          return null;
                        },
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (_recalibrateKey.currentState!.validate()) {
                        _recalibrateKey.currentState!.save();
                        print(recalList);
                        File file = await _tripdata;
                        // var newdata = recal;
                        // var data = jsonDecode(recalList);
                        var data = jsonEncode(recalList);
                        print("data:$data");
                        file.writeAsString(data);
                        Navigator.pop(context);
                      }
                    },
                    child: const Text('Submit'),
                  ),
                  Container(
                    margin: const EdgeInsets.all(20),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 32.0, bottom: 8),
                      child: Column(
                        children: [
                          Material(
                            elevation: 10,
                            color: Colors.blueGrey,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: Container(
                                decoration: const BoxDecoration(
                                    // border: Border.all(),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                padding: const EdgeInsets.all(15),
                                // color: Colors.blueGrey,
                                child: Column(
                                  children: [
                                    Row(
                                      children: const [
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 70),
                                        ),
                                        Icon(
                                          Icons.notification_important_outlined,
                                          color: Colors.white,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 10),
                                        ),
                                        Text(
                                          'Note',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                    const Divider(
                                      color: Colors.grey,
                                      thickness: 1.1,
                                      endIndent: 150,
                                    ),
                                    const Text(
                                        'Input data as an Array of JSON Objects',
                                        textAlign: TextAlign.left,
                                        style:
                                            TextStyle(color: Colors.white70)),
                                    const Divider(
                                      color: Colors.grey,
                                      thickness: 1.1,
                                      endIndent: 250,
                                    ),
                                    const Text(
                                        'Each JSON Object should have the following keys:',
                                        textAlign: TextAlign.left,
                                        style:
                                            TextStyle(color: Colors.white70)),
                                    const Text('maxsoc, minsoc & temp necessarily.',
                                        textAlign: TextAlign.left,
                                        style:
                                            TextStyle(color: Colors.white70)),
                                    // Divider(
                                    //   color: Colors.grey,
                                    //   thickness: 1.1,
                                    //   endIndent: 150,
                                    // ),
                                    const Padding(
                                        padding: EdgeInsets.only(bottom: 20)),
                                    const Text('Example ',
                                        textAlign: TextAlign.left,
                                        style:
                                            TextStyle(color: Colors.white38)),
                                    const Divider(
                                      color: Colors.grey,
                                      thickness: 1.1,
                                      // indent: 250,
                                    ),
                                    const Text(
                                        '[{"maxsoc":"80","minsoc":"72","temp":"30"}]',
                                        textAlign: TextAlign.left,
                                        style: const TextStyle(color: Colors.white)),
                                  ],
                                )),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              File file = await _localFile;
              
              print("Data reset!");
              file.writeAsString("[]");
            },
            child: const Text('Reset All Data'),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.redAccent)),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            color: Colors.blueGrey,
            child: Row(
              children: const [
                Padding(padding: EdgeInsets.only(left: 50)),
                Icon(
                  Icons.info_outline,
                  color: Colors.white,
                ),
                Text(
                  'Data once reset cannot be recovered',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
