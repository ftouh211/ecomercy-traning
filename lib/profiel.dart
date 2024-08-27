import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Profiel extends StatelessWidget {
  static const String routeName = "Profiel";

  final user = FirebaseAuth.instance.currentUser!;
   Profiel({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,

        title: Text("Your Profile",style: TextStyle(fontSize: 23,fontWeight: FontWeight.w400),),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(backgroundImage: AssetImage("assets/images/panda.png"),radius: 50,),
            SizedBox(height: 20,),
            Text("Hellow, You are Signed in",style: TextStyle(fontSize: 26,fontWeight: FontWeight.w700),),
            SizedBox(height: 20,),
            Text(user.email!,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
            // Text(user.!),
          ],
        ),
      ),
    );
  }
}
