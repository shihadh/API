import 'package:shared_preferences/shared_preferences.dart';

class TokenManager {
  static const accessToken = 'accessToken';
  static const refreshToken = 'refreshToken';

  static Future<void> saveToken(String access, String refresh)async{
    final preference = await SharedPreferences.getInstance();
    await preference.setString(accessToken, access);
    await preference.setString(refreshToken, refresh);
  }

  static Future<String?>getAccessToken()async{
    final preference = await SharedPreferences.getInstance();
    return preference.getString(accessToken);
  }

  static Future<String?>getRefreshToken()async{
    final preference = await SharedPreferences.getInstance();
    return preference.getString(refreshToken);
  }

  static Future<void>clearToken()async{
    final preference = await SharedPreferences.getInstance();
    await preference.remove(accessToken);
    await preference.remove(refreshToken);
  }
}