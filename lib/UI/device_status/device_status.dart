import 'package:flutter/material.dart';
import 'package:sepsmm/Drawer/drawer.dart';
import 'package:firebase_database/firebase_database.dart';

class DeviceStatus extends StatefulWidget {
  const DeviceStatus({Key? key}) : super(key: key);
  @override
  State<DeviceStatus> createState() => _DeviceStatusState();
}

class _DeviceStatusState extends State<DeviceStatus> {
  // bool load_1 = false;
  // bool load_2 = false;
  // bool load_3 = false;
  // bool load_4 = false;

  final dbRef = FirebaseDatabase.instance.ref();

  // onUpdate_1() {
  //   setState(() {
  //     load_1 = !load_1;
  //   });
  // }
  //
  // onUpdate_2() {
  //   setState(() {
  //     load_2 = !load_2;
  //   });
  // }
  //
  // onUpdate_3() {
  //   setState(() {
  //     load_3 = !load_3;
  //   });
  // }
  //
  // onUpdate_4() {
  //   setState(() {
  //     load_4 = !load_4;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black12,
      appBar: AppBar(
        title: const Text("Device's Live Status"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            color: Colors.indigo,
            height: 250,
            width: double.maxFinite,
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Here You Can See yours Live Status of Appliances",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Voltage",
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontSize: 24, color: Colors.black,fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("220", textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 24, color: Colors.white)),
                            SizedBox(width: 10,),
                            Text("VAC", textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 24, color: Colors.red,fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Kwh",
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontSize: 24, color: Colors.black,fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("1000", textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 24, color: Colors.white)),
                            SizedBox(width: 10,),
                            Text("KWH", textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 24, color: Colors.red,fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Text("Total Units Consumed" ,textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 24, color: Colors.black,fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("100", textAlign: TextAlign.center,
    style: TextStyle(fontSize: 24, color: Colors.white)),
                            SizedBox(width: 10,),
                            Text("Units", textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 24, color: Colors.red,fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ],
                    ))
              ],
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              buildHeader(context),
              buildMenuItems(context),
            ],
          ),
        ),
      ),
    );
  }
}

//   Future<void> onWrite_1() async {
//     dbRef.child("All_Loads").set({"Load_1": !load_1});
//   }
//
//   Future<void> onWrite_2() async {
//     dbRef.child("All_Loads").set({"Load_2": !load_2});
//   }
//
//   Future<void> onWrite_3() async {
//     dbRef.child("All_Loads").set({"Load_3": !load_3});
//   }
//
//   Future<void> onWrite_4() async {
//     dbRef.child("All_Loads").set({"Load_4": !load_4});
//   }
// }
