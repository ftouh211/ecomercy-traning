import 'package:flutter/material.dart';

class team extends StatelessWidget {
  static const String routeName = "team";
  const team({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(

        backgroundColor: Colors.white,
        title: const Text(
          "Our Team",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage('assets/images/soudi.jpg',),
              ),
            ),
            SizedBox(
              height: 15,

            ),
            Text(
              "Ahmed Soudi",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Mobile Application Developer With (Flutter)",
              style: TextStyle(fontSize: 10, ),
            ),
            SizedBox(height: 20),
            ////2
//Divider(thickness: 1,endIndent: 39,indent: 39,color: Colors.black,),
            SizedBox(height: 20),
            CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage('assets/images/ftouh.jpg'),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Ftouh Abdelsamed",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Mobile Application Developer With (Flutter)",
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}