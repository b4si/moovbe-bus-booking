import 'package:flutter/material.dart';
import 'package:moovbe/view/login_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.redAccent.shade400,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.37,
            ),
            const Center(
              child: Image(
                image: AssetImage('assets\\moovbe.jpg'),
              ),
            ),
            SizedBox(
              height: size.height * 0.36,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) {
                    return LoginScreen();
                  },
                ));
              },
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Container(
                  width: size.width,
                  height: size.height * 0.07,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: Center(
                    child: Text(
                      'Get Started',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.redAccent.shade400),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
