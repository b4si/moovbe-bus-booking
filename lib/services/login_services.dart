import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:moovbe/core/urls.dart';
import 'package:moovbe/model/login_data_model.dart';
import 'package:moovbe/services/shared_preferences_services.dart';
import 'package:moovbe/view/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginServies {
  dynamic loginData = [];
  Future loginToHome(context, userName, passWord) async {
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(
          strokeWidth: 7,
          color: Colors.white,
          backgroundColor: Colors.black54,
        ),
      ),
    );

    try {
      log(baserul + loginUrl);

      var response = await http.post(
        Uri.parse(baserul + loginUrl),
        body: {
          "username": userName,
          "password": passWord,
        },
      ).timeout(
        const Duration(seconds: 15),
      );
      loginData = json.decode(response.body);
      var temp = LoginDataModel.fromJson(loginData);
      log(temp.status.toString());

      if (temp.status == true) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: ((context) => const HomePage())),
            (route) => false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.green.shade800,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.all(15.0),
            elevation: 6.0,
            margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            content: const Text('Login Successfully completed'),
          ),
        );

        await SharedPreferencesServices().saveApikey(temp.urlId!);
        await SharedPreferencesServices().saveAccessKey(temp.access!);
        log(temp.access.toString());
      } else if (temp.status == false) {
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.red.shade800,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.all(15.0),
            elevation: 6.0,
            margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            content: const Text('Invalid user'),
          ),
        );
      }
    } on TimeoutException {
      Navigator.of(context).pop();
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: ((context) => const HomePage())),
          (route) => false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.green.shade800,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.all(15.0),
          elevation: 6.0,
          margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          content: const Text('Something went wrong'),
        ),
      );
    } catch (e, s) {
      log("+--------------------------------Error---------------------------------------\n$e");
      log("+--------------------------------Stack---------------------------------------\n$s");
    }
  }
}
