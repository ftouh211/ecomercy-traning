import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SettingsPage extends StatefulWidget {
  static const String routeName = "settings";
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _notificationsEnabled = false;
  bool _darkMode = false;

  void _toggleNotifications(bool value) {
    setState(() {
      _notificationsEnabled = value;
    });
  }

  void _toggleDarkMode(bool value) {
    setState(() {
      _darkMode = value;
    });
  }

  void _saveSettings() {
    // Implement the save functionality here
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Settings saved!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,

        backgroundColor: Colors.white,
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back),
        //   onPressed: () {
        //     //    Navigator.pushNamed(context => .routeName);
        //   },
        // ),
        title: const Text(
          "Catigores",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
       body: //ListView(
      //   padding: EdgeInsets.all(16.0),
      //   children: [
      //     Text("Genral Settings",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
      //     SizedBox(height: 20,),
      //
      //     Padding(
      //       padding: const EdgeInsets.symmetric(horizontal: 14.0),
      //       child: Row(
      //         children: [
      //           Expanded(child: Text("Edit Profile",style: TextStyle(fontSize: 25),)),
      //           IconButton(
      //             icon: Icon(Icons.account_box),
      //             onPressed: () {
      //               //    Navigator.pushNamed(context => .routeName);
      //             },
      //           )  ],
      //       ),
      //     ),
      //     SizedBox(height: 10,),
      //     Padding(
      //       padding: const EdgeInsets.symmetric(horizontal: 14.0),
      //       child: Row(
      //         children: [
      //           Expanded(child: Text("Change Password",style: TextStyle(fontSize: 25),)),
      //           IconButton(
      //             icon: Icon(Icons.lock),
      //             onPressed: () {
      //               //    Navigator.pushNamed(context => .routeName);
      //             },
      //           )  ],
      //       ),
      //     ),
      //     SizedBox(height: 10,),
      //     Padding(
      //       padding: const EdgeInsets.symmetric(horizontal: 14.0),
      //       child: Row(
      //         children: [
      //           Expanded(child: Text("Favourites",style: TextStyle(fontSize: 25),)),
      //           IconButton(
      //             icon: Icon(Icons.favorite),
      //             onPressed: () {
      //               //    Navigator.pushNamed(context => .routeName);
      //             },
      //           )  ],
      //       ),
      //     ),
      //
      //     Padding(
      //       padding: const EdgeInsets.only(top: 8.0),
      //       child: SwitchListTile(
      //
      //         title: Text('Enable Notifications',style: TextStyle(fontSize: 20),),
      //         value: _notificationsEnabled,
      //         onChanged: _toggleNotifications,
      //       ),
      //     ),
      //
      //
      //     SizedBox(height: 20),
      //     SwitchListTile(
      //       title: Text('Enable Dark Mode',style: TextStyle(fontSize: 20)),
      //       value: _darkMode,
      //       onChanged: _toggleDarkMode,
      //     ),
      //     SizedBox(height: 30),
      //
      //
      //
      //     //     TextFormField(
      //     // decoration: InputDecoration(
      //     // label: Text("Your Complaint"),
      //     // border: OutlineInputBorder(
      //     // borderRadius: BorderRadius.circular(18),
      //     // ),
      //     // enabledBorder: OutlineInputBorder(
      //     // borderRadius: BorderRadius.circular(18))),
      //     // ),
      //
      //     SizedBox(height: 35),
      //
      //     ElevatedButton(
      //       onPressed: _saveSettings,
      //       child: Text('Save Settings',style: TextStyle(color: Colors.black),),
      //     ),
      //   ],
      // ),
    );
  }
}