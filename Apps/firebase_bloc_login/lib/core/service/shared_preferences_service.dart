import 'package:shared_preferences/shared_preferences.dart';

class SharedService {
  Future<void> setInt({
    required String name,
    required String surname,
    required String email,
    required String phone,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("name", name);
    await prefs.setString("surnname", surname);
    await prefs.setString("email", email);
    await prefs.setString("phone", phone);
  }
}
