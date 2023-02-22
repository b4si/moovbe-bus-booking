import 'dart:async';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:moovbe/core/urls.dart';
import 'package:moovbe/view/home_screen.dart';

class LoginServies {
  loginToHome(context, userName, passWord) async {
    // final provider = Provider.of<LoginProvider>(context, listen: false);
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

      if (response.statusCode == 200) {
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
      }
    } on TimeoutException {
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
