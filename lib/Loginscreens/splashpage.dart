import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:realestate/Loginscreens/loginpage.dart';
import 'package:realestate/constants/appcolors.dart';
import 'package:realestate/screens/nav.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .3,
          ),
          SizedBox(
              height: 150,
              width: 150,
              child: Image.asset(
                "assets/reazalogo.png",
                fit: BoxFit.fill,
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "Reaza",
                style: TextStyle(
                    color: AppColors.dblue,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
                textAlign: TextAlign.center,
              ),
              Text(
                "Homes",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .3,
          ),
          const SpinKitThreeBounce(
            color: AppColors.dblue,
            size: 20.0,
          )
        ],
      ),
    ));
  }

  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
      if (getLogin() == true) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const navbar()));
      } else {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LoginPage()));
      }
    });
  }
}

Future<bool> getLogin() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.getInt('id');
  prefs.getString('name');
  prefs.getString(
    'email',
  );
  if (prefs.getInt('id') != null) {
    return true;
  } else {
    return false;
  }
}
