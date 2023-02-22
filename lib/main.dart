import 'package:flutter/material.dart';
import 'package:moovbe/controller/login_provider.dart';

import 'package:moovbe/view/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => LoginProvider(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          // title: 'Flutter Demo',
          theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
          home: const SplashScreen(),
        ));
  }
}
