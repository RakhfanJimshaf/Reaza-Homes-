import 'package:flutter/material.dart';
import 'package:realestate/constants/appcolors.dart';
import 'package:realestate/screens/add_property.dart';
import 'package:realestate/screens/chatuserlist.dart';
import 'package:realestate/screens/feedbackpage.dart';
import 'package:realestate/screens/my_properties.dart';
import 'package:realestate/screens/myfav.dart';
import 'package:realestate/screens/profilepage.dart';

Widget getDrawer(BuildContext context) {
  showdialoge() {
    showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text(
                    'Real estate',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  content: Text(
                    'Do you want to logout..?',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  actions: <Widget>[
                    TextButton(
                        onPressed: () => Navigator.of(context).pop(false),
                        child: Text(
                          'NO',
                          style: TextStyle(
                            color: AppColors.dblue,
                          ),
                        )),
                    TextButton(
                        onPressed: () => Navigator.of(context).pop(true),
                        child: InkWell(
                          child: Text(
                            'YES',
                            style: TextStyle(
                              color: AppColors.dblue,
                            ),
                          ),
                          onTap: () async {
                            // SharedPreferences prefs =
                            //     await SharedPreferences.getInstance();
                            // prefs.remove('email');
                            // print("email");
                            // Navigator.pushReplacement(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (BuildContext ctx) => SplashPage()));
                          },
                        ))
                  ],
                ))
        .then((value) => print('Selected Alert Option: ' + value.toString()));
  }

  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        SizedBox(
          height: 100,
          child: DrawerHeader(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: <Color>[
                AppColors.dblue,
                AppColors.dblue,
              ])),
              child: Row(
                children: const <Widget>[
                  Icon(
                    Icons.home_outlined,
                    size: 25,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Home",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              )),
        ),
        ListTile(
          leading: const Icon(
            Icons.shopping_basket,
            size: 25,
            color: AppColors.dblue,
          ),
          title: const Text("Add property"),
          trailing: const Icon(Icons.arrow_right),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const AddpropertyPage()));
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.favorite_rounded,
            size: 23,
            color: AppColors.dblue,
          ),
          title: const Text("My Favourites"),
          trailing: const Icon(Icons.arrow_right),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const myfav()));
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.panorama,
            size: 23,
            color: AppColors.dblue,
          ),
          title: const Text("My Properties"),
          trailing: const Icon(Icons.arrow_right),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const MypropertiesPage()));
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.person,
            size: 23,
            color: AppColors.dblue,
          ),
          title: const Text("Profile"),
          trailing: const Icon(Icons.arrow_right),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ProfilePage()));
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.person,
            size: 23,
            color: AppColors.dblue,
          ),
          title: const Text("Add feedback"),
          trailing: const Icon(Icons.arrow_right),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const FeedbackPage()));
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.logout,
            size: 23,
            color: AppColors.dblue,
          ),
          title: const Text("Chat"),
          trailing: const Icon(Icons.arrow_right),
          onTap: () async {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ChatPage()));
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.logout,
            size: 23,
            color: AppColors.dblue,
          ),
          title: const Text("Logout"),
          trailing: const Icon(Icons.arrow_right),
          onTap: () async {
            showdialoge();
          },
        ),
      ],
    ),
  );
}
