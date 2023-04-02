import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:realestate/models/profile_model.dart';
import 'package:realestate/screens/edit_profile.dart';
import 'package:realestate/services/profile_service.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.only(left: 0.0, top: 60),
          child: SizedBox(
              height: 80,
              width: 500,
              child: Text(
                "Profile",
                style: GoogleFonts.reemKufi(color: Colors.black),
              )),
        ),
      ),
      // appBar: AppBar(
      //   iconTheme: const IconThemeData(color: AppColors.dblue),
      //   backgroundColor: Colors.white,
      //   title: Text(
      //     "Profile",
      //     style: GoogleFonts.openSans(
      //         color: AppColors.dblue,
      //         fontWeight: FontWeight.w600,
      //         fontSize: 20),
      //     textAlign: TextAlign.center,
      //   ),
      //   elevation: 0,
      // ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15),
        child: FutureBuilder<List<Profilemodel>>(
            future: getProfile(),
            builder: (BuildContext context,
                AsyncSnapshot<List<Profilemodel>> snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: CircleAvatar(
                        radius: 60,
                        backgroundImage: AssetImage("assets/profilepic.png"),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      snapshot.data!.first.name,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      snapshot.data!.first.email,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 40,
                      width: MediaQuery.of(context).size.width * .35,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            foregroundColor: MaterialStateProperty.all<Color>(
                                Colors.deepPurple),
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.purple),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ))),
                        onPressed: () async {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProfileEditPage(
                                        email: snapshot.data!.first.email,
                                        password: snapshot.data!.first.pswd,
                                        address: snapshot.data!.first.address,
                                        phone: snapshot.data!.first.phone,
                                      ))).then((value) {
                            setState(() {
                              getProfile();
                            });
                            return value;
                          });
                        },
                        child: Text(
                          "Edit profile",
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.022,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Divider(
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(40)),
                            child: Icon(
                              Icons.favorite_outline,
                              color: Colors.pink,
                            )),
                        Text(
                          "My favourites",
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.022,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),
                        Icon(
                          Icons.keyboard_arrow_right,
                          color: Colors.black,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(40)),
                            child: Icon(
                              Icons.add,
                              color: Colors.pink,
                            )),
                        Text(
                          "Add properties",
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.022,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),
                        Icon(
                          Icons.keyboard_arrow_right,
                          color: Colors.black,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(40)),
                            child: Icon(
                              Icons.logout,
                              color: Colors.pink,
                            )),
                        Text(
                          "Logout",
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.022,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),
                        Icon(
                          Icons.keyboard_arrow_right,
                          color: Colors.black,
                        )
                      ],
                    ),
                  ],
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Image.asset(
                    "assets/noimage.png",
                    height: 50,
                  ),
                );
              } else {
                return Container();
              }
            }),
      ),
    );
  }
}
