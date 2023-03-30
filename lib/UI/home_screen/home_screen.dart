import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sepsmm/Drawer/drawer.dart';
import 'package:sepsmm/UI/auth/login_screen.dart';
import 'package:sepsmm/utils/utils.dart';
import 'package:percent_indicator/percent_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final auth = FirebaseAuth.instance;
  void _openPage(Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => page,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                auth.signOut().then((value) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()));
                }).onError((error, stackTrace) {
                  Utils().toastMessage(error.toString());
                });
              },
              icon: const Icon(Icons.logout)),
          const SizedBox(
            width: 10,
          ),
        ],
        // automaticallyImplyLeading: false,
        title: const Text("Home Screen"),
        centerTitle: true,
      ),
      body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.redAccent,
            image: DecorationImage(
              image: AssetImage('assets/images/background.PNG'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              Center(
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  MaterialButton(
                    color: Colors.blueAccent,
                    child: const Text("Circular Library"),
                    onPressed: () => _openPage(SampleCircularPage() ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(20.0),
                  ),
                  MaterialButton(
                    color: Colors.blueAccent,
                    child: const Text("Linear Library"),
                    onPressed: () => _openPage(SampleLinearPage()),
                  ),
                ],
              ),
      ),
            ],
          )),
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