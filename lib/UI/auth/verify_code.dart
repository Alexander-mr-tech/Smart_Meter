import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sepsmm/Widgets/rounded_button.dart';
import 'package:sepsmm/home_screen.dart';
import 'package:sepsmm/utils/utils.dart';

class VerifyCode extends StatefulWidget {
  final String verificationId;
  const VerifyCode({Key? key, required this.verificationId}) : super(key: key);

  @override
  State<VerifyCode> createState() => _VerifyCodeState();
}

class _VerifyCodeState extends State<VerifyCode> {
  bool loading= false;
  final auth = FirebaseAuth.instance;
  final verifyCodeController= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Verify Code"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 150,
                width:250,
                child: Image.asset(
                  "assets/images/meter.png",
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                "Enter Verification Code Here!",
                style: GoogleFonts.pacifico(
                  fontSize: 22,
                ),
              ),
              const SizedBox(height: 15,),
              TextFormField(
                style: const TextStyle(fontSize: 20),
                controller: verifyCodeController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: 'Enter your 6 Digits Code',
                  prefixIcon: const Icon(Icons.password_sharp),
                  prefixIconColor: Colors.pink,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              RoundButton(
                title: "Verify",loading: loading,
                onTap: ()async{
                  setState(() {
                    loading=true;
                  });
                  final credential = PhoneAuthProvider.credential(
                    verificationId: widget.verificationId,
                    smsCode: verifyCodeController.text.toString()
                  );
                  try{
                    await auth.signInWithCredential(credential);
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const HomeScreen()));
                  }catch(e){
                    setState(() {
                      loading=false;
                    });
                    Utils().toastMessage(e.toString());

                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
