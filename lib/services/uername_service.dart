import 'package:shared_preferences/shared_preferences.dart';

class Username {

  static getUserNameFrommDB() async{
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('username');
  }
}