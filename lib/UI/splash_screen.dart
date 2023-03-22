import 'package:flutter/material.dart';
import 'package:sepsmm/Firebase%20Services/Splash_Services.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices splashScreen = SplashServices();
  @override
  void initState(){
    super.initState();
    splashScreen.isLogin(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/meter.png",
              fit: BoxFit.cover,
            ),
            Text("Welcome to SEPSMM",style: GoogleFonts.pacifico(
              fontSize: 30,
              color: Colors.black54
            ),),
          ],
        ),
      ),
    );
  }
}
