import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:realestate/Loginscreens/loginpage.dart';
import 'package:realestate/services/register_service.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  bool isChecked = false;

  final namecontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final addresscontroller = TextEditingController();
  final phonecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Image.asset(
            "assets/spl.webp",
            fit: BoxFit.cover,
          ),
          BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 60, sigmaY: 60),
              child: Container(
                color: Colors.grey.withOpacity(0.1),
              )),
          Padding(
            padding: const EdgeInsets.only(left: 35, right: 35),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 120,
                  ),
                  Center(
                      child: Text(
                    "Create new account",
                    style: GoogleFonts.didactGothic(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  )),
                  const SizedBox(
                    height: 70,
                  ),
                  Container(
                    height: 60,
                    decoration: BoxDecoration(
                        color: Colors.black26,
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: TextField(
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "First name",
                              hintStyle: TextStyle(color: Colors.white38)),
                          controller: namecontroller,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 60,
                    decoration: BoxDecoration(
                        color: Colors.black26,
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: TextField(
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: "Address",
                                hintStyle: TextStyle(color: Colors.white38)),
                            controller: addresscontroller,
                            style: const TextStyle(color: Colors.white)),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.black26,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: TextField(
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Phone number",
                                  hintStyle: TextStyle(color: Colors.white38)),
                              controller: phonecontroller,
                              style: const TextStyle(color: Colors.white)),
                        ),
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.black26,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: TextField(
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: "Email address",
                                hintStyle: TextStyle(color: Colors.white38)),
                            controller: emailcontroller,
                            style: const TextStyle(color: Colors.white)),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.black26,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: TextField(
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: "Password",
                                hintStyle: TextStyle(color: Colors.white38)),
                            controller: passwordcontroller,
                            style: const TextStyle(color: Colors.white)),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Checkbox(
                        checkColor: Colors.white70,
                        value: isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value!;
                          });
                        },
                      ),
                      const Text(
                        "I agree with the Terms and Policy",
                        style: TextStyle(color: Colors.white70, fontSize: 12),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 75,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                              height: 35,
                              width: 35,
                              child: Image.asset("assets/google.png")),
                          const Text(
                            "Sign Up with Google",
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      height: 75,
                      decoration: const BoxDecoration(),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: const Color(0xFF2C3539),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20))),
                          onPressed: () async {
                            register(
                                    namecontroller.text.toString(),
                                    addresscontroller.text.toString(),
                                    phonecontroller.text.toString(),
                                    emailcontroller.text.toString(),
                                    passwordcontroller.text.toString())
                                .then((value) => {
                                      if (value.status == "success")
                                        {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const LoginPage())),
                                          Fluttertoast.showToast(
                                              msg: 'Registration Successful',
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
                                                "Please fill the empty fields",
                                                style: TextStyle(
                                                    color: Colors.black)),
                                            backgroundColor: Colors.white,
                                          ))
                                        }
                                    });
                          },
                          child: const Text("Sign Up")))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
