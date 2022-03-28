import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'caution.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Data extends StatefulWidget {
  Data({Key? key}) : super(key: key);

  @override
  State<Data> createState() => _DataState();
}

var _value = 5.0;
var _value2 = 5.0;
var _fst = false;
var _fst2 = false;

class _DataState extends State<Data> {
  GlobalKey<FormState> _dataKey = GlobalKey<FormState>();

  Map<String, dynamic> dataMap = <String, dynamic>{
    'dd': "",
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
          Padding(
            padding: const EdgeInsets.only(top:55.0),
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
          )
          ,
          Container(
            child: Form(
              key: _dataKey,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 50),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Duration of trip ',
                      hintText: 'Enter the duration of trip in minutes',
                      icon: Icon(Icons.battery_charging_full),
                    ),
                    onSaved: (String? val) {
                      dataMap['dd'] = val;
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                  ),
                  Text('SOC before trip'),
                  Slider(
                    label: _value.toString(),
                    min: 0,
                    max: 100,
                    divisions: 10,
                    value: _value,
                    onChanged: (double val) => {
                      setState(() => _value = val),
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                  ),
                  Text('SOC after trip'),
                  Slider(
                    label: _value2.toString(),
                    min: 0,
                    max: 100,
                    divisions: 10,
                    value: _value2,
                    onChanged: (double val) => {setState(() => _value2 = val)},
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20, left: 15, bottom: 20),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Distance of trip ',
                        hintText: 'Enter the distance of trip in Km',
                        suffixIcon: Icon(Icons.add_road_rounded),
                        // icon: Icon(Icons.battery_charging_full),
                      ),
                      onSaved: (String? val) {
                        // dataMap['dd'] = val;
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
                          },
                        ),
                      ),
                      Text('Fast charging')
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
                          },
                        ),
                      ),
                      Text('Ambient Operating Temperature over 30 degrees\n Celsius')
                    ],
                    // ],
                    // ],
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
