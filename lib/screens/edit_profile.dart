import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:realestate/constants/appcolors.dart';
import 'package:realestate/services/editprofile_service.dart';

class ProfileEditPage extends StatefulWidget {
  // final MypetModel model;
  String email;
  String password;
  String address;
  String phone;
  ProfileEditPage({
    Key? key,
    required this.email,
    required this.password,
    required this.address,
    required this.phone,
  }) : super(key: key);

  @override
  State<ProfileEditPage> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage>
    with SingleTickerProviderStateMixin {
  final FocusNode myFocusNode = FocusNode();
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  final TextEditingController addressController = new TextEditingController();
  final TextEditingController phoneController = new TextEditingController();

  String firstName = "";
  String newprice = "";
  String newage = "";
  String newweight = "";
  String newdescription = "";
  String newvaccine = "";
  bool _status = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColors.dblue),
        backgroundColor: Colors.white,
        title: Text(
          "Edit",
          style: GoogleFonts.openSans(
              color: AppColors.dblue,
              fontWeight: FontWeight.w600,
              fontSize: 20),
          textAlign: TextAlign.center,
        ),
        elevation: 0,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 15,
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage("assets/profilepic.png"),
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Edit pet details',
                      style: TextStyle(
                          color: AppColors.dblue,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold),
                    ),
                    _status ? _getEditIcon() : new Container(),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  'Email',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                TextField(
                  controller: emailController,
                  enabled: !_status,
                  autofocus: !_status,
                  onChanged: (String value) {
                    firstName = value;
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'Password',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                TextField(
                  controller: passwordController,
                  enabled: !_status,
                  onChanged: (String value) {
                    newprice = value;
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'Address',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                TextField(
                  controller: addressController,
                  enabled: !_status,
                  onChanged: (String value) {
                    newage = value;
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'Phone',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                TextField(
                  controller: phoneController,
                  enabled: !_status,
                  onChanged: (String value) {
                    newweight = value;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                !_status ? _getActionButtons() : new Container(),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    super.dispose();
  }

  @override
  void initState() {
    String newemail = widget.email;
    String newpswd = widget.password;
    String newaddress = widget.address;
    String newphone = widget.phone;

    emailController.text = newemail;
    passwordController.text = newpswd;
    addressController.text = newaddress;
    phoneController.text = newphone;

    return super.initState();
  }

  _getActionButtons() {
    return new Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(right: 25.0),
          child: Container(
              width: MediaQuery.of(context).size.width * .4,
              child: new ElevatedButton(
                style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.deepPurple),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.green),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ))),
                child: new Text(
                  "Save",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  getEditprofile(
                    emailController.text.toString(),
                    passwordController.text.toString(),
                    addressController.text.toString(),
                    phoneController.text.toString(),
                  ).then((value) {
                    if (value.status == "success") {
                      Fluttertoast.showToast(
                        msg: "Profile edited",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.black,
                        textColor: Colors.white,
                        fontSize: 14,
                      );
                      Navigator.pop(context);
                    }
                  });
                  setState(() {
                    _status = true;
                    FocusScope.of(context).requestFocus(new FocusNode());
                  });
                },
              )),
        ),
        Container(
            width: MediaQuery.of(context).size.width * .4,
            child: new ElevatedButton(
              child: new Text(
                "Cancel",
                style: TextStyle(color: Colors.white),
              ),
              style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.deepPurple),
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ))),
              onPressed: () {
                setState(() {
                  _status = true;
                  FocusScope.of(context).requestFocus(new FocusNode());
                });
              },
            )),
      ],
    );
  }

  _getEditIcon() {
    return new GestureDetector(
      child: new CircleAvatar(
        backgroundColor: Colors.red,
        radius: 14.0,
        child: new Icon(
          Icons.edit,
          color: Colors.white,
          size: 16.0,
        ),
      ),
      onTap: () {
        setState(() {
          _status = false;
        });
      },
    );
  }
}
