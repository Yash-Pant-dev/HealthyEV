import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var batteryName = 'Nexon';
  var temp = '-';
  var dischargeCycles = '-';
  var capacity = 46;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
                    ListTile(
                      leading: Image.asset('assets/carbattery.png', ),
                      title: const Text('At a Glance'),
                      subtitle: Text(
                        'Battery Details: $batteryName $capacity' + 'Whr',
                        style: TextStyle(color: Colors.black.withOpacity(0.6)),
                      ),
                    ),
                    Image.asset('assets/batterywear.jpg',),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'Average Ambient Temp.: $temp   Discharge Cycles: $dischargeCycles' +
                            'WHr',
                        style: TextStyle(color: Colors.black.withOpacity(0.9)),
                      ),
                    ),
                  ],
                ),
              ),
              Scaffold(
                body: Container(
                  child: const Text('hi'),
                ),
                floatingActionButton: FloatingActionButton.extended(
                  onPressed: () {},
                  icon: const Icon(Icons.add),
                  label: const Text('Add New Data'),
                  backgroundColor: Colors.blue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
} //TODO: Add toast/snackbar when data updates
