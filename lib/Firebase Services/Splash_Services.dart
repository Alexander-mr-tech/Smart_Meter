// ignore_for_file: file_names

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sepsmm/UI/auth/login_screen.dart';
import 'package:sepsmm/home_screen.dart';

class SplashServices{
  void isLogin(BuildContext context){
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;
    if(user!=null){
    Timer(const Duration(seconds:5),()=>
      Navigator.push(context, MaterialPageRoute(builder: (context)=>const HomeScreen()))
    );
  }else
    {
      Timer(const Duration(seconds:5),()=>
          Navigator.push(context, MaterialPageRoute(builder: (context)=>const LoginScreen()))
      );
    }
  }
}