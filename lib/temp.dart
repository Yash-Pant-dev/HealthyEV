// ignore_for_file: use_key_in_widget_constructors
import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'By Yash Pant',
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/caution': (context) => WarningCard(),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  var batteryName = 'Nexon';
  var war1 = "this is another warning ";
  var war2 = "this is a warning ";

  var temp = '-';
  var dischargeCycles = '-';
  var capacity = 46;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/warning': (context) => WarningCard(),
      },
      title: 'Flutter Demo',
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
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
                    Container(
                      margin:
                          const EdgeInsets.only(left: 10, right: 10, top: 15),
                      decoration: const BoxDecoration(
                          // border: Border.all(),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Material(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          color: Colors.blueGrey,
                          elevation: 30,
                          child: Column(children: [
                            ListTile(
                              leading: Image.asset(
                                'assets/carbattery.png',
                              ),
                              title: const Text('At a Glance'),
                              subtitle: Text(
                                'Battery Details: $batteryName $capacity' +
                                    'Whr',
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.6)),
                              ),
                            ),
                            Image.asset(
                              'assets/batterywear.png',
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Center(
                                child: Text(
                                  'BEV Name.: $temp             Initial Capacity: $dischargeCycles' +
                                      'WHr',
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.9)),
                                ),
                              ),
                            ),
                          ])),
                    ),
                    Container(
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
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Text(
                                  '1: $war2',
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Text('2: $war1'),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(
                                    left: 250, top: 20, bottom: 10),
                                child: Text('Tap for more details.'),
                              )
                            ],
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
                                      "Connect with our servers online to get more accurate analysis and compare battery life with other users" , style: TextStyle(fontSize: 15),),
                                ),
                              ),
                              Padding(padding: EdgeInsets.only(bottom: 20),),
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
                    Container(
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
                                padding: const EdgeInsets.only(bottom: 10),
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
                                Padding(padding: EdgeInsets.only(left: 180,
                                ),),
                                Icon(Icons.add , size: 12,),
                                Text('Tap to recalibrate', style: TextStyle(fontSize: 12),),
                                Padding(padding: EdgeInsets.only(bottom: 20))
                              ],
                            ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                floatingActionButton: FloatingActionButton.extended(
                  onPressed: ()=> {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>WarningCard()))
                  },
                  icon: const Icon(Icons.add),
                  label: const Text('Add another EV'),
                  backgroundColor: Colors.blue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
} 

class WarningCard extends StatefulWidget {
  WarningCard({Key? key}) : super(key: key);

  @override
  State<WarningCard> createState() => _WarningCardState();
}

class _WarningCardState extends State<WarningCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // add second screen here
      appBar: AppBar(
        title: Text('Recommendations'),
      ),
      body: Container(
        child: Text('data')
      ),
      floatingActionButton: FloatingActionButton (
        onPressed: ()=> {
          Navigator.pop(context)
        },
        
        child: Text('return'),
        backgroundColor: Colors.blue,
      ),
    );
  }
}












//TODO: Add toast/snackbar when data updates
// checkout emoji_transportation_rounded as icon