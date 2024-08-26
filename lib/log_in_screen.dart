import 'package:ecomercy/sign_up.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = "login";
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isPasswordVisible = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffF8F8F8),

        body: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(30.0),
            child: Container(
              // color: Colors.yellow,
              // padding: EdgeInsets.all(16.0),
              child: Form(
                key: formKey,

                child: Column(
                  children: [
                    Text("WELCOME !",style: TextStyle(fontSize: 35),),
                    SizedBox(height: 40,),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          labelText: "Email or Phone",
                          labelStyle: TextStyle(color: Colors.black)
                        // prefixIcon: Icon(Icons.email),
                        // border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      controller: passwordController,
                      obscureText: !isPasswordVisible,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: "Password",
                        labelStyle: TextStyle(color: Colors.black),
                        // prefixIcon: Icon(Icons.lock),
                        suffixIcon: IconButton(
                          icon: Icon(
                            isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              isPasswordVisible = !isPasswordVisible;
                            });
                          },
                        ),
                        // border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 30),
                    Container(
                      color: Colors.blue,
                      width: double.infinity,
                      child: MaterialButton(
                        onPressed: () {
                          if (formKey.currentState?.validate() ?? false) {
                            print(emailController.text);
                            print(passwordController.text);
                          }
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Text("Don't have an account? ",style: TextStyle(color: Colors.black,fontSize: 20),),
                    SizedBox(height: 10),

                    TextButton(
                      onPressed: () {Navigator.pushNamed(context,SignUp.routeName );},
                      child: Text("Register",style: TextStyle(color: Colors.blue,fontSize: 15),),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}