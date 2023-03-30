import 'package:flutter/material.dart';
import 'package:sepsmm/Drawer/drawer.dart';
import 'package:firebase_database/firebase_database.dart';

class DeviceControl extends StatefulWidget {
  const DeviceControl({Key? key}) : super(key: key);
  @override
  State<DeviceControl> createState() => _DeviceControlState();
}

class _DeviceControlState extends State<DeviceControl> {
  bool load_1 = false;
  bool load_2 = false;
  bool load_3 = false;
  bool load_4 = false;

  final dbRef = FirebaseDatabase.instance.ref();

  Future onUpdate_1() async{
    setState(() {
      load_1 = !load_1;
    });
  }

  Future onUpdate_2() async{
    setState(() {
      load_2 = !load_2;
    });
  }

  onUpdate_3() {
    setState(() {
      load_3 = !load_3;
    });
  }

  onUpdate_4() {
    setState(() {
      load_4 = !load_4;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Device's Control"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 200,
                width: 200,
                child: Image.asset(
                  "assets/images/meter.png",
                  fit: BoxFit.cover,
                ),
              ),
              ListTile(
                leading: const Icon(
                  Icons.account_tree_outlined,
                  size: 35,
                ),
                title: const Text(
                  'LOAD 1',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                subtitle: const Text(
                  'Turn\nON & OFF',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.indigoAccent,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                trailing:FloatingActionButton.extended(
                  onPressed: () {
                    onUpdate_1();
                    onWrite_1();
                  },
                  label: load_1? const Text("ON") : const Text("OFF"),
                  elevation: 20,
                  backgroundColor: load_1? Colors.green:Colors.redAccent,
                  icon: load_1? const Icon(Icons.visibility) : const Icon(
                      Icons.visibility_off),
                ),

                selected: true, // set to true to highlight the tile
                enabled: true, // set to false to disable the tile
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 8.0, horizontal: 16.0), // set padding
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)), // set shape
                tileColor: Colors.grey[200], // set background color
                selectedTileColor:
                    Colors.blue[200], // set background color when selected
                focusColor: Colors.red[200], // set color when tile is in focus
                hoverColor:
                    Colors.green[200], // set color when tile is hovered over
              ),
              const SizedBox(height: 10,),
              ListTile(
                leading: const Icon(
                  Icons.account_tree_outlined,
                  size: 35,
                ),
                title: const Text(
                  'LOAD 2',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                subtitle: const Text(
                  'Turn\nON & OFF',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.indigoAccent,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                trailing: FloatingActionButton.extended(
                  onPressed: () {
                    onUpdate_2();
                    onWrite_2();
                  },
                  label: load_2? const Text("ON") : const Text("OFF"),
                  elevation: 20,
                  backgroundColor: load_2? Colors.green:Colors.redAccent,
                  icon: load_2? const Icon(Icons.visibility) : const Icon(
                      Icons.visibility_off),
                ),

                selected: true, // set to true to highlight the tile
                enabled: true, // set to false to disable the tile
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 8.0, horizontal: 16.0), // set padding
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)), // set shape
                tileColor: Colors.grey[200], // set background color
                selectedTileColor:
                Colors.blue[200], // set background color when selected
                focusColor: Colors.red[200], // set color when tile is in focus
                hoverColor:
                Colors.green[200], // set color when tile is hovered over
              ),
              const SizedBox(height: 10,),
              ListTile(
                leading: const Icon(
                  Icons.account_tree_outlined,
                  size: 35,
                ),
                title: const Text(
                  'LOAD 3',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                subtitle: const Text(
                  'Turn\nON & OFF',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.indigoAccent,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                trailing: FloatingActionButton.extended(
                  onPressed: () {
                    onUpdate_3();
                    onWrite_3();
                  },
                  label: load_3? const Text("ON") : const Text("OFF"),
                  elevation: 20,
                  backgroundColor: load_3? Colors.green:Colors.redAccent,
                  icon: load_3? const Icon(Icons.visibility) : const Icon(
                      Icons.visibility_off),
                ),

                selected: true, // set to true to highlight the tile
                enabled: true, // set to false to disable the tile
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 8.0, horizontal: 16.0), // set padding
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)), // set shape
                tileColor: Colors.grey[200], // set background color
                selectedTileColor:
                Colors.blue[200], // set background color when selected
                focusColor: Colors.red[200], // set color when tile is in focus
                hoverColor:
                Colors.green[200], // set color when tile is hovered over
              ),
              const SizedBox(height: 10,),
              ListTile(
                leading: const Icon(
                  Icons.account_tree_outlined,
                  size: 35,
                ),
                title: const Text(
                  'LOAD 4',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,),
                ),
                subtitle: Text(
                  'Turn\nON & OFF',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.redAccent.withOpacity(0.8),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                trailing: FloatingActionButton.extended(
                  onPressed: () {
                    onUpdate_4();
                    onWrite_4();
                  },
                  label: load_4? const Text("ON") : const Text("OFF"),
                  elevation: 20,
                  backgroundColor: load_4? Colors.green:Colors.redAccent,
                  icon: load_4? const Icon(Icons.visibility) : const Icon(
                      Icons.visibility_off),
                ),

                selected: true, // set to true to highlight the tile
                enabled: true, // set to false to disable the tile
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 8.0, horizontal: 16.0), // set padding
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)), // set shape
                tileColor: Colors.grey[200], // set background color
                selectedTileColor:
                Colors.blue[200], // set background color when selected
                focusColor: Colors.red[200], // set color when tile is in focus
                hoverColor:
                Colors.green[200], // set color when tile is hovered over
              ),
            ],
          ),
        ),
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

  Future<void> onWrite_1() async {
    dbRef.child("All_Loads").set({"Load_1": !load_1});
  }

  Future<void> onWrite_2() async {
    dbRef.child("All_Loads").set({"Load_2": !load_2});
  }

  Future<void> onWrite_3() async {
    dbRef.child("All_Loads").set({"Load_3": !load_3});
  }

  Future<void> onWrite_4() async {
    dbRef.child("All_Loads").set({"Load_4": !load_4});
  }
}


