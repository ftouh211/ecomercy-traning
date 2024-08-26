import 'package:ecomercy/firebase_options.dart';
import 'package:ecomercy/itroduction_screen.dart';
import 'package:ecomercy/log_in_screen.dart';
import 'package:ecomercy/sign_up.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "start",
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      initialRoute:IntroScreen.routeName ,
      routes: {
        IntroScreen.routeName:(context) => IntroScreen(),
        LoginScreen.routeName:(context) => LoginScreen(),
        SignUp.routeName:(context) => SignUp(),
      },


    );
  }
}
