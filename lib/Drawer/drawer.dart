import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sepsmm/device_status.dart';
import 'package:sepsmm/devices_control.dart';
import 'package:sepsmm/ohm_law.dart';
import 'package:sepsmm/UI/auth/login_screen.dart';
import 'package:sepsmm/UserProfile.dart';
import 'package:sepsmm/home_screen.dart';
import 'package:sepsmm/utils/utils.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) => Drawer(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildHeader(context),
              buildMenuItems(context),
            ],
          ),
        ),
      );
}

Widget buildHeader(BuildContext context) => Material(
      color: Colors.indigo,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const UserProfile(),
          ));
        },
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.only(
            top: 24 + MediaQuery.of(context).padding.top,
            bottom: 24,
          ),
          child: const Column(
            children: [
              CircleAvatar(
                radius: 80,
                backgroundColor: Colors.indigoAccent,
               child: CircleAvatar(
                 radius: 77,
                 backgroundImage: AssetImage(
                     'assets/images/meter.png'),
               ),
               ),
              SizedBox(
                height: 12,
              ),
              Text(
                "SEPSMM",
                style: TextStyle(fontSize: 28, color: Colors.white),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                "sepsmm@gmaill.com",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
final auth = FirebaseAuth.instance;
Widget buildMenuItems(BuildContext context) => Container(
      padding: const EdgeInsets.all(10),
      child: Wrap(
        // runSpacing: 10,
        children: [
          ListTile(
            // contentPadding: const EdgeInsets.only(left: 10.0),
            leading: const Icon(
              Icons.home,
              color: Colors.indigo,
              size: 30,
            ),
            title: const Text(
              'Home',
              style: TextStyle(color: Colors.blue,fontSize: 20, fontWeight: FontWeight.bold),
            ),
            onTap: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const HomeScreen())),
          ),
          const Divider(
            color: Colors.blue,
            thickness: 2,
          ),
          ListTile(
            leading: const Icon(Icons.device_hub_outlined,color: Colors.indigo,
              size: 30),
            title: const Text("Device's Control",
              style: TextStyle(color: Colors.blue,fontSize: 20, fontWeight: FontWeight.bold,),
            ),
            onTap: ()=> Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const DeviceControl())),
          ),
          const Divider(
            color: Colors.blue,
            thickness: 2,
          ),
          ListTile(
            leading: const Icon(Icons.pest_control,color: Colors.indigo,
              size: 30),
            title: const Text("Device's Status",
              style: TextStyle(color: Colors.blue,fontSize: 24, fontWeight: FontWeight.bold),
            ),
            onTap: ()=> Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const DeviceStatus())),
          ),
          const Divider(
            color: Colors.blue,
            thickness: 2,
          ),
          ListTile(
            leading: const Icon(Icons.mark_unread_chat_alt_rounded,color: Colors.indigo,
              size: 30),
            title: const Text("Ohm's Law",
              style: TextStyle(color: Colors.blue,fontSize: 24, fontWeight: FontWeight.bold),
            ),
            onTap: ()=> Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const ohm_law())),
          ),
          const Divider(
            color: Colors.blue,
            thickness: 2,
          ),
          ListTile(
            leading: const Icon(Icons.logout_sharp,color: Colors.indigo,
              size: 30),
            title: const Text('Logout',
              style: TextStyle(color: Colors.blue,fontSize: 24, fontWeight: FontWeight.bold),
            ),
            onTap: () {
              auth.signOut().then((value) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()));
              }).onError((error, stackTrace) {
                Utils().toastMessage(error.toString());
              });
            },
          ),
          const Divider(
            color: Colors.blue,
            thickness: 2,
          ),
        ],
      ),
    );
