import 'package:battery_health_monitor/info.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'caution.dart';
import 'Data.dart';
import 'package:shared_preferences/shared_preferences.dart';

var capacity;
var year;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();

  // Future<void> getData();
}

Future<String> getData() async {
  var batteryName;
  final prefs = await SharedPreferences.getInstance();
  batteryName = prefs.getString('bevname') ?? "";
  capacity = prefs.getString('year') ?? "";

  print(batteryName + "/" + capacity);
  // return 1;
  return batteryName;
}

class _HomePageState extends State<HomePage> {
  var batteryName = 'Nexon';
  var capacity = '46';
  var year = '2020';

  void setInfo(int a, String b) {
    if (a == 0) {
      setState(() {
        batteryName = b;
      });
    }
    if (a == 1) {
      setState(() {
        capacity = b;
      });
    }
  }

  //  void name(args) {
  //   set
  // }
  var war1 = " ";
  var war2 = " ";
  // var batteryName1 = getData();
  var temp = '-';
  var dischargeCycles = '-';
  @override
  Widget build(BuildContext context) {
    // setState(() async {
    //   batteryName = batteryName1;
    // });
    return MaterialApp(
      routes: {
        // '/caution': (context) => Caution(), //FIXME: Not needed?
      },
      title: 'Flutter Demo',
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: kToolbarHeight / 1,
            leading: const Icon(Icons.car_repair),
            title: const Text(
              'Healthy EV',
              style: TextStyle(
                fontFamily: 'Poppins', //FIXME: Poppins doesnt apply
                fontSize: 25,
              ),
            ),
            automaticallyImplyLeading: false,
            backgroundColor: Colors.blue,
            bottom: TabBar(
              indicatorColor: Colors.white,
              tabs: [
                Tab(
                  child: Center(
                    child: Row(
                      children: const [
                        Icon(Icons.analytics_outlined),
                        Text('ANALYSIS')
                      ],
                    ),
                  ),
                ),
                Tab(
                  child: Row(
                    children: const [
                      Icon(Icons.monitor_rounded),
                      Text('DATA AND INPUT')
                    ],
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Card(
                clipBehavior: Clip.antiAlias,
                child: Column(
                  children: [
                    Builder(builder: (context) {
                      return GestureDetector(
                        onTap: () async {
                          Map<String, dynamic> result = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Info(),
                            ),
                          );
                          //snackbar requires a context b/w the scaff and this so we need to use a builder
                          ScaffoldMessenger.of(context)
                            ..removeCurrentSnackBar()
                            ..showSnackBar(SnackBar(
                                behavior: SnackBarBehavior.floating,
                                margin: EdgeInsets.only(
                                    left: 8, right: 8, bottom: 8),
                                content: Text('Data Updated!')));
                          setState(() {
                            batteryName = result['BEVname'];
                            capacity = result['BCAP'];
                            year = result['year'];
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.only(
                              left: 10, right: 10, top: 15),
                          decoration: const BoxDecoration(
                              // border: Border.all(),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Material(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              color: Colors.blueGrey,
                              elevation: 30,
                              child: Column(children: [
                                ListTile(
                                  leading: Hero(
                                    tag: 'batteryIcon',
                                    child: Image.asset(
                                      'assets/carbattery.png',
                                    ),
                                  ),
                                  title: const Text('At a Glance'),
                                  subtitle: Text(
                                    'BEV Details: $batteryName ',
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.6)),
                                  ),
                                ),
                                Image.asset(
                                  'assets/batterywear.png',
                                  fit: BoxFit.contain,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 16.0,
                                      left: 16,
                                      right: 16,
                                      bottom: 25),
                                  child: Center(
                                    child: Text(
                                      'Year of Purchase.: $year             Initial Capacity: $capacity'
                                      'WHr',
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(0.9)),
                                    ),
                                  ),
                                ),
                              ])),
                        ),
                      );
                    }),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/caution');
                      },
                      child: Container(
                        margin:
                            const EdgeInsets.only(top: 40, left: 10, right: 10),
                        // color: Colors.blue,
                        child: Material(
                          color: Colors.blueGrey,
                          elevation: 20,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular((10))),
                          child: Container(
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Center(
                                  child: Icon(
                                    Icons.warning_outlined,
                                    color: Colors.white,
                                    size: 50,
                                  ),
                                ),
                                const Divider(
                                  thickness: 2,
                                  indent: 10,
                                  endIndent: 5,
                                ),
                                Center(
                                  child: Text('Warnings'),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 15.0,
                                      left: 10,
                                      right: 10,
                                      bottom: 0),
                                  child: Text(
                                    '$war2',
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Text(' $war1'),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(
                                      top: 20, bottom: 40, right: 15),
                                  child: Align(
                                      alignment: Alignment.bottomRight,
                                      child: Text(
                                        'Tap for more details.',
                                      )),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    // )
                  ],
                ),
              ),
              Scaffold(
                body: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                        left: 10,
                        right: 10,
                        top: 20,
                      ),
                      child: Material(
                        borderRadius: BorderRadius.circular(10),
                        elevation: 10,
                        child: Container(
                          // margin: EdgeInsets.only(top: 20),
                          child: Column(
                            children: [
                              Row(
                                children: const [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: 120,
                                    ),
                                  ),
                                  Icon(
                                    Icons.connect_without_contact,
                                    color: Colors.orange,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 5),
                                  ),
                                  Text(
                                    "Connect Online",
                                    style: TextStyle(
                                        color: Colors.orange, fontSize: 17),
                                  ),
                                ],
                              ),
                              const Divider(
                                thickness: 1,
                                indent: 10,
                                endIndent: 10,
                              ),
                              const Center(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 8, top: 8, right: 8, bottom: 16),
                                  child: Text(
                                    "Connect with our servers online to get more accurate analysis and compare battery life with other users",
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(bottom: 20),
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10)),
                                    color: Colors.blue),
                                margin: const EdgeInsets.only(top: 0),
                                // color: Colors.blue,
                                child: Row(
                                  children: const [
                                    Padding(
                                      padding:
                                          EdgeInsets.only(left: 130, top: 40),
                                    ),
                                    Icon(Icons.touch_app),
                                    Text("Click to Connect"),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        Map<String, dynamic> result2 = await Navigator.push(
                            context,
                            MaterialPageRoute(builder: ((context) => Data())));
                        setState(() {
                          if (result2['temp'] == 'true' &&
                              result2['chargebw'] == 'false') {
                            war1 =
                                "Try to leave car in rest mode for a few minutes after every long drive";
                          } else if (result2['temp'] == 'false' &&
                              result2['chargebw'] == 'true') {
                            war1 = 'Avoid fast charging';
                          } else if (result2['chargebw'] == 'true' &&
                              result2['temp'] == 'true') {
                            war2 = 'Avoid fast charging';
                          } else {
                            war1 = 'No issues found';
                            war2 = '';
                          }
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.only(
                          top: 50,
                          left: 20,
                          right: 20,
                        ),
                        child: Material(
                          borderRadius: BorderRadius.circular(10),
                          elevation: 10,
                          color: Colors.blueGrey,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 8, right: 8, top: 20, bottom: 20),
                            child: Column(
                              children: [
                                const Center(
                                  child: Text(
                                    'Add New Data',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                ),
                                const Text(
                                    'Provide additional data over various metrics to get more precise predictions.'),
                                const Padding(
                                  padding: EdgeInsets.only(bottom: 15),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: const [
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: 180,
                                      ),
                                    ),
                                    Icon(
                                      Icons.add,
                                      size: 12,
                                    ),
                                    Text(
                                      'Tap to add',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ],
                                ),
                                const Divider(
                                  thickness: 1,
                                  indent: 30,
                                  endIndent: 35,
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                ),
                                const Center(
                                  child: Text(
                                    'Recalibrate Data',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                ),
                                const Text(
                                    'Recalculate all factors by testing the BEV over longer distances.'),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: const [
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: 180,
                                      ),
                                    ),
                                    Icon(
                                      Icons.add,
                                      size: 12,
                                    ),
                                    Text(
                                      'Tap to recalibrate',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(bottom: 20))
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                floatingActionButton: FloatingActionButton.extended(
                  onPressed: () => {
                    Navigator.pushNamed(context, '/caution'),
                  },
                  icon: const Icon(Icons.add),
                  label: const Text('Refresh Data'),
                  backgroundColor: Colors.blue,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
