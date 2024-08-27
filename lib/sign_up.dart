// import 'package:ecomercy/firebase_function.dart';
// import 'package:ecomercy/sign_up.dart';
// import 'package:flutter/material.dart';
//
// class SignUp extends StatefulWidget {
//   static const String routeName = "signup";
//   SignUp({super.key});
//
//   @override
//   State<SignUp> createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<SignUp> {
//   bool isPasswordVisible = false;
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//
//   var formKey = GlobalKey<FormState>();
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Color(0xffF8F8F8),
//
//         body: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Center(child: Container(
//             decoration: BoxDecoration(),
//               child: SignUpForm())),
//         ),
//       ),
//     );
//   }
// }
// class SignUpForm extends StatefulWidget {
//   @override
//   _SignUpFormState createState() => _SignUpFormState();
// }
//
// class _SignUpFormState extends State<SignUpForm> {
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   final _formKey = GlobalKey<FormState>();
//
//   String _firstName = '';
//   String _lastName = '';
//   String _gender = 'Male';
//   int _age = 0;
//   DateTime _birthday = DateTime.now();
//   String _email = '';
//   String _password = '';
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Form(
//         key: _formKey,
//         child: SingleChildScrollView(
//           child: Column(
//             children: <Widget>[
//               Text("New Account",style: TextStyle(fontSize: 35),),
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'First Name'),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your first name';
//                   }
//                   return null;
//                 },
//                 onSaved: (value) {
//                   _firstName = value!;
//                 },
//               ),
//               SizedBox(height: 10,),
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'Last Name'),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your last name';
//                   }
//                   return null;
//                 },
//                 onSaved: (value) {
//                   _lastName = value!;
//                 },
//               ),
//               SizedBox(height: 10,),
//
//               DropdownButtonFormField<String>(
//                 decoration: InputDecoration(labelText: 'Gender'),
//                 value: _gender,
//                 items: ['Male', 'Female', 'Other'].map((String value) {
//                   return DropdownMenuItem<String>(
//                     value: value,
//                     child: Text(value),
//                   );
//                 }).toList(),
//                 onChanged: (String? newValue) {
//                   setState(() {
//                     _gender = newValue!;
//                   });
//                 },
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please select your gender';
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(height: 10,),
//
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'Age'),
//                 keyboardType: TextInputType.number,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your age';
//                   }
//                   if (int.tryParse(value) == null || int.parse(value) <= 0) {
//                     return 'Please enter a valid age';
//                   }
//                   return null;
//                 },
//                 onSaved: (value) {
//                   _age = int.parse(value!);
//                 },
//               ),
//               SizedBox(height: 10,),
//
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'Birthday'),
//                 readOnly: true,
//                 onTap: () async {
//                   DateTime? pickedDate = await showDatePicker(
//                     context: context,
//                     initialDate: _birthday,
//                     firstDate: DateTime(1900),
//                     lastDate: DateTime.now(),
//                   );
//                   if (pickedDate != null && pickedDate != _birthday) {
//                     setState(() {
//                       _birthday = pickedDate;
//                     });
//                   }
//                 },
//                 controller: TextEditingController(
//                   text: "${_birthday.toLocal()}".split(' ')[0],
//                 ),
//               ),
//               SizedBox(height: 10,),
//
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'Email'),
//                 keyboardType: TextInputType.emailAddress,
//                 controller: emailController,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your email';
//                   }
//                   if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
//                     return 'Please enter a valid email';
//                   }
//                   return null;
//                 },
//                 onSaved: (value) {
//                   _email = value!;
//                 },
//               ),
//               SizedBox(height: 10,),
//
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'Password'),
//                 obscureText: true,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your password';
//                   }
//                   if (value.length < 6) {
//                     return 'Password must be at least 6 characters long';
//                   }
//                   return null;
//                 },
//                 onSaved: (value) {
//                   _password = value!;
//                 },
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () {
//                   FirebaseFunctions.createAcount(emailController.text, passwordController.text);
//                   print("Email: ${emailController.text}, Password: ${passwordController.text}");
//                   if (_formKey.currentState!.validate()) {
//                     _formKey.currentState!.save();
//                     // Handle the submission of form data (e.g., send it to a server)
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(content: Text('Signing Up...')),
//                     );
//                   }
//                 },
//                 child: Text('Sign Up'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:ecomercy/home_screen.dart';
import 'package:ecomercy/log_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:ecomercy/firebase_function.dart';

class SignUp extends StatefulWidget {
  static const String routeName = "signup";
  SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffF8F8F8),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Container(
              decoration: BoxDecoration(),
              child: SignUpForm(),
            ),
          ),
        ),
      ),
    );
  }
}

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Text("New Account", style: TextStyle(fontSize: 35)),
              TextFormField(
                decoration: InputDecoration(labelText: 'First Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your first name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(labelText: 'Last Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your last name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(labelText: 'Gender'),
                value: 'Male',
                items: ['Male', 'Female', 'Other'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {},
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select your gender';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(labelText: 'Age'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your age';
                  }
                  if (int.tryParse(value) == null || int.parse(value) <= 0) {
                    return 'Please enter a valid age';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(labelText: 'Birthday'),
                readOnly: true,
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  );
                  if (pickedDate != null) {
                    setState(() {
                      // Handle picked date
                    });
                  }
                },
                controller: TextEditingController(text: 'Select Date'),
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
                controller: passwordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  if (value.length < 6) {
                    return 'Password must be at least 6 characters long';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Signing Up...')),
                    );
                    bool success = await FirebaseFunctions.createAcount(
                      emailController.text,
                      passwordController.text,
                    );
                    if (success) {
                      Navigator.pushNamed(context, HomeScreen.routeName);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Sign up failed.')),
                      );
                    }
                  }
                },
                child: Text('Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
