import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:realestate/constants/appcolors.dart';
import 'package:realestate/screens/add_property.dart';
import 'package:realestate/screens/chatuserlist.dart';
import 'package:realestate/screens/homepage.dart';
import 'package:realestate/screens/myfav.dart';
import 'package:realestate/screens/profilepage.dart';
import 'package:simple_speed_dial/simple_speed_dial.dart';

class navbar extends StatefulWidget {
  const navbar({Key? key}) : super(key: key);

  @override
  State<navbar> createState() => _navbarState();
}

class _navbarState extends State<navbar> {
  int _selectedIndex = 0;
  void navigate(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final String _text = '';
  final List<Widget> screens = [
    const HomePage(),
    const myfav(),
    const ChatPage(),
    const ProfilePage(),
    const AddpropertyPage(),
  ];
  final control = AdvancedDrawerController();

  @override
  Widget build(BuildContext context) {
    bool existDialog() {
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
                          color: Colors.purple,
                        ),
                      )),
                  TextButton(
                      onPressed: () => SystemNavigator.pop(),
                      child: InkWell(
                        child: Text(
                          'YES',
                          style: TextStyle(
                            color: Colors.purple,
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
              ));
      return true;
    }

    return AdvancedDrawer(
        backdropColor: Colors.purple.shade800,
        controller: control,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 300),
        animateChildDecoration: true,
        rtlOpening: false,
        // openScale: 1.0,
        disabledGestures: false,
        childDecoration: const BoxDecoration(
          // NOTICE: Uncomment if you want to add shadow behind the page.
          // Keep in mind that it may cause animation jerks.
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.blue, Colors.purple]),
          boxShadow: <BoxShadow>[
            BoxShadow(
              // color: Colors.black12,
              blurRadius: 0.0,
            ),
          ],
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        drawer: ListTileTheme(
          textColor: Colors.white,
          iconColor: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 128,
                height: 128,
                margin: const EdgeInsets.only(
                  top: 24,
                  bottom: 64,
                ),
                // clipBehavior: Clip.antiAlias,
                // decoration: const BoxDecoration(
                //     color: Colors.black26, shape: BoxShape.circle),
                // child: Image.asset("reazalogo.png"),
              ),
              ListTile(
                onTap: () {
                  setState(() {
                    navigate(4);
                  });
                },
                leading: const Icon(Icons.home),
                title: Text(
                  "Post a Property",
                  style: GoogleFonts.didactGothic(fontSize: 17),
                ),
              ),
              ListTile(
                onTap: () {
                  setState(() {
                    navigate(0);
                  });
                },
                leading: const Icon(Icons.home),
                title: Text(
                  "Home",
                  style: GoogleFonts.didactGothic(fontSize: 17),
                ),
              ),
              ListTile(
                onTap: () {
                  setState(() {
                    navigate(2);
                  });
                },
                leading: const Icon(Icons.chat),
                title: Text("Chats",
                    style: GoogleFonts.didactGothic(fontSize: 17)),
              ),
              ListTile(
                onTap: () {
                  setState(() {
                    navigate(1);
                  });
                },
                leading: const Icon(Icons.favorite_outline_rounded),
                title: Text("Favourite",
                    style: GoogleFonts.didactGothic(fontSize: 17)),
              ),
              ListTile(
                onTap: () {
                  setState(() {
                    navigate(3);
                  });
                },
                leading: const Icon(Icons.account_circle_rounded),
                title: Text("Account",
                    style: GoogleFonts.didactGothic(fontSize: 17)),
              ),
              // ListTile(
              //   onTap: () {},
              //   leading: const Icon(Icons.settings),
              //   title: Text("Settings",
              //       style: GoogleFonts.didactGothic(fontSize: 17)),
              // ),
              ListTile(
                onTap: () {
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
                                  onPressed: () =>
                                      Navigator.of(context).pop(false),
                                  child: Text(
                                    'NO',
                                    style: TextStyle(
                                      color: AppColors.dblue,
                                    ),
                                  )),
                              TextButton(
                                  onPressed: () => SystemNavigator.pop(),
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
                          ));
                },
                leading: const Icon(Icons.logout),
                title: Text("Logout",
                    style: GoogleFonts.didactGothic(fontSize: 17)),
              ),
            ],
          ),
        ),
        child: Scaffold(
          body: WillPopScope(
              onWillPop: () async {
                existDialog();
                return true;
              },
              child: screens[_selectedIndex]),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: GNav(
              backgroundColor: Colors.white,
              padding: const EdgeInsets.all(16),
              color: Colors.black,
              activeColor: Colors.white,
              tabBackgroundColor: Colors.purple.withOpacity(0.8),
              hoverColor: Colors.purple,
              duration: const Duration(milliseconds: 400),
              gap: 8,
              tabs: const [
                GButton(
                  icon: Icons.home_outlined,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.favorite_border_outlined,
                  text: 'Liked',
                ),
                GButton(
                  icon: Icons.chat_outlined,
                  text: 'Chats',
                ),
                GButton(
                  icon: Icons.person_outline,
                  text: 'Account',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: navigate,
            ),
          ),
          floatingActionButton: SpeedDial(
            labelsBackgroundColor: Colors.white,
            speedDialChildren: <SpeedDialChild>[
              // SpeedDialChild(
              //   child: const Icon(Icons.directions_run),
              //   foregroundColor: Colors.white,
              //   backgroundColor: Colors.red,
              //   label: 'Let\'s go for a run!',
              //   onPressed: () {
              //     setState(() {
              //       _text = 'You pressed "Let\'s go for a run!"';
              //     });
              //   },
              // ),
              SpeedDialChild(
                child: const Icon(Icons.add_home),
                foregroundColor: Colors.white,
                backgroundColor: Colors.purple,
                label: 'Add a Property',
                onPressed: () {
                  setState(() {
                    navigate(4);
                  });
                },
              ),
              // SpeedDialChild(
              //   child: const Icon(Icons.directions_bike),
              //   foregroundColor: Colors.white,
              //   backgroundColor: Colors.green,
              //   label: 'Let\'s go cycling!',
              //   onPressed: () {
              //     setState(() {
              //       _text = 'You pressed "Let\'s go cycling!"';
              //     });
              //   },
              // ),
            ],
            closedForegroundColor: Colors.white,
            openForegroundColor: Colors.white,
            closedBackgroundColor: Colors.purple,
            openBackgroundColor: Colors.purple.shade700,
            child: const Icon(Icons.add),
          ),
        ));
  }
}
