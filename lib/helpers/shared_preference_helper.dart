import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {
  SharedPreferenceHelper._();
  static SharedPreferenceHelper sharedHelper = SharedPreferenceHelper._();
  SharedPreferences? sharedPreferences;
  initSharedPreferences() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  putLetter(String key, int value) async {
    // value is number of stars
    bool? isPut = await sharedPreferences?.setInt(key, value);
    print('is put in sharedPreference? $isPut');
  }

  int? getLetter(String key) {
    return sharedPreferences?.getInt(key);
  }
}
