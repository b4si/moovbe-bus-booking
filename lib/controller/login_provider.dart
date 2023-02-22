import 'package:flutter/material.dart';
import 'package:moovbe/services/login_services.dart';

class LoginProvider with ChangeNotifier {
  Future<void> loginToHome(context, username, password) async {
    await LoginServies().loginToHome(context, username, password);
    notifyListeners();
  }
}
