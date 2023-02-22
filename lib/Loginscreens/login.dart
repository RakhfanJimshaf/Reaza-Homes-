// ignore_for_file: duplicate_import

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:realestate/Loginscreens/registrationpage.dart';
import 'package:realestate/screens/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../services/login_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:realestate/Loginscreens/registrationpage.dart';
import 'package:realestate/services/login_service.dart';

class loginp extends StatefulWidget {
  const loginp({Key? key}) : super(key: key);

  @override
  State<loginp> createState() => _loginpState();
}

class _loginpState extends State<loginp> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Image.asset(
            "Assets/spl.webp",
            fit: BoxFit.cover,
          ),
          BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 60, sigmaY: 60),
              child: Container(
                color: Colors.grey.withOpacity(0.1),
              )),
          Padding(
            padding: const EdgeInsets.only(left: 35.0, right: 35.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 150,
                  ),
                  Text(
                    "Welcome Back!",
                    style: GoogleFonts.didactGothic(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text("Please sign in to your account",
                      style: TextStyle(color: Colors.white70)),
                  const SizedBox(
                    height: 70,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.black26,
                        borderRadius: BorderRadius.circular(20)),
                    height: 75,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: TextField(
                          style: const TextStyle(color: Colors.white),
                          controller: emailcontroller,
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Email or phone",
                              hintStyle: TextStyle(color: Colors.white38)),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.black26,
                        borderRadius: BorderRadius.circular(20)),
                    height: 75,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20),
                        child: TextField(
                          style: const TextStyle(color: Colors.white),
                          controller: passwordcontroller,
                          obscureText: true,
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Password",
                              hintStyle: TextStyle(color: Colors.white38),
                              suffixIcon: Icon(
                                Icons.remove_red_eye,
                                color: Colors.white24,
                              )),
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 200.0, top: 30),
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(
                          color: Colors.white24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 75,
                    decoration: const BoxDecoration(
                        // borderRadius: BorderRadius.circular()
                        ),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: const Color(0xFF2C3539),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                        onPressed: () async {
                          login(emailcontroller.text.toString(),
                                  passwordcontroller.text.toString())
                              .then((value) => {
                                    _addItem(value.id, value.name,
                                        emailcontroller.text),
                                    if (value.status == "success")
                                      {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const HomePage())),
                                        Fluttertoast.showToast(
                                            msg: 'Login Successful',
                                            toastLength: Toast.LENGTH_SHORT,
                                            fontSize: 16,
                                            gravity: ToastGravity.BOTTOM,
                                            backgroundColor: Colors.white,
                                            textColor: Colors.black)
                                      }
                                    else
                                      {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                          content: Text(
                                              "Login Failed ! Wrong credentials🥵",
                                              style: TextStyle(
                                                  color: Colors.black)),
                                          backgroundColor: Colors.white,
                                        ))

                                        // Fluttertoast.showToast(
                                        //     msg: 'Login Failed',
                                        //     toastLength: Toast.LENGTH_SHORT,
                                        //     gravity: ToastGravity.BOTTOM,
                                        //     backgroundColor: Colors.white,
                                        //     textColor: Colors.red)
                                      }
                                  });
                        },
                        child: const Text("Sign In")),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 75,
                    decoration: const BoxDecoration(
                        // borderRadius: BorderRadius.circular()
                        ),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                                height: 35,
                                width: 35,
                                child: Image.asset(
                                  'Assets/google.png',
                                )),
                            const Text(
                              "Sign In with Google",
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        )),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "New to Agile?",
                        style: TextStyle(color: Colors.white),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const RegistrationPage()));
                          },
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(color: Colors.blue),
                          ))
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  _addItem(int id, String name, String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('id', id);
    prefs.setString('name', name);
    prefs.setString('email', email);
  }
}
