import 'package:shared_preferences/shared_preferences.dart';

class UserData {
  late SharedPreferences prefs;

  Future<String> get getEmail async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String emailvalue = prefs.getString('email') ?? "";
    return emailvalue;
  }

  Future<String> get getName async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String namevalue = prefs.getString('name') ?? "";
    return namevalue;
  }

  Future<int> get getUId async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int intValue = prefs.getInt('id') ?? 0;
    return intValue;
  }
}
