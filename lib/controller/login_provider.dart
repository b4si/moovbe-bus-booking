import 'package:flutter/material.dart';
import 'package:moovbe/services/login_services.dart';

class LoginProvider with ChangeNotifier {
  dynamic loginData = [];

  Future<void> loginToHome(context, username, password) async {
    await LoginServies().loginToHome(context, username, password);

    notifyListeners();
  }
}
