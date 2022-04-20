import 'package:flutter/material.dart';

class Caution extends StatefulWidget {
  Caution({Key? key}) : super(key: key);

  @override
  State<Caution> createState() => _CautionState();
}

class _CautionState extends State<Caution> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // add second screen here
      appBar: AppBar(
        title: Text('Recommendations'),
      ),
      body: Column(
        
        children: [
          Padding(
            padding: const EdgeInsets.only(top : 16.0),
            child: Text('What Each Warning Means:', style: TextStyle(fontSize: 20)),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            color: Color.fromARGB(60, 107, 105, 105),
            padding: EdgeInsets.only(top: 20, bottom: 40, left: 15, right: 15),
            child: Column(
              children: [
                Container(color: Colors.white60, child: Text('Temperature Warning'), padding: EdgeInsets.symmetric(horizontal: 40,vertical: 20), margin: EdgeInsets.only(bottom: 10),),
                Divider(
                  thickness: 1,
                  color: Colors.white,

                ),
                Text('Issue: Your EV battery is exceeding optimal operation temperatures. '),
                Divider(
                  thickness: 1,
                  color: Colors.white,
                ),
                Text('Solution: Consider reducing the load on the battery by reducing speed of EV/ Checking if all coolants are adequately filled.'),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            color: Color.fromARGB(60, 107, 105, 105),
            padding: EdgeInsets.only(top: 20, bottom: 40,left: 15, right: 15),
            child: Column(
              children: [
                Container(color: Colors.white60, child: Text('High State of Charge Warning'), padding: EdgeInsets.symmetric(horizontal: 40,vertical: 20), margin: EdgeInsets.only(bottom: 10),),
                Divider(
                  thickness: 1,
                  color: Colors.white,

                ),
                Text('Issue: Batteries degrade faster if they are charged to very high percentages, too often. '),
                Divider(
                  thickness: 1,
                  color: Colors.white,
                ),
                Text('Solution: Consider charging them to a lower level before trips.'),
              ],
            ),
          )
        ],
      ),
      
    );
  }
}
