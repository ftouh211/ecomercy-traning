import 'package:ecomercy/home_screen.dart';
import 'package:ecomercy/log_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroScreen extends StatelessWidget {
 static const String routeName = "intro";
  IntroScreen({super.key});

  final List<PageViewModel> pages = [
    PageViewModel(
        title: "First page",
        body: "describtion",
        image: Image.asset("assets/images/one.jpg"),
        decoration: PageDecoration(
            titleTextStyle:
                TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
        footer: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                )),
            onPressed: () {},
            child: const Text(
              "lets go",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ))),
    PageViewModel(
        title: "Second page",
        body: "describtion",
        image: Image.asset("assets/images/two.jpg"),
        decoration: PageDecoration(
            titleTextStyle:
                TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
        footer: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                )),
            onPressed: () {},
            child: const Text(
              "lets go",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ))),
    PageViewModel(
        title: "third page",
        body: "describtion",
        image: Image.asset("assets/images/three.jpg"),
        decoration: PageDecoration(
            titleTextStyle:
                TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
        footer: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                )),
            onPressed: () {},
            child: const Text(
              "lets go",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF8F8F8),
      appBar: AppBar(
        title: Text(
          "Welcome",
          style: TextStyle(fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: IntroductionScreen(
          pages: pages,
          dotsDecorator: DotsDecorator(
            size: Size(15, 15),
            color: Colors.blue,
            activeSize: Size.square(20),
            activeColor: Colors.red,
          ),
          showDoneButton: true,
          done: Text(
            "Done",
            style: TextStyle(fontSize: 20),
          ),
          showSkipButton: true,
          skip: Text(
            "Skip",
            style: TextStyle(fontSize: 20),
          ),
          showNextButton: true,
          next: Icon(
            Icons.arrow_forward,
            size: 20,
          ),
          onDone: () => onDone(context),
        ),
      ),
    );
  }
}

void onDone(context) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => LoginScreen()));
}
