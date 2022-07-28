import 'package:flutter/material.dart';
import 'package:sozler_app/screens/explore_page.dart';
import 'package:sozler_app/screens/form/login_page.dart';
import 'package:sozler_app/screens/form/register_page.dart';
import 'package:sozler_app/screens/profile_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfilePage(),
    );
  }
}
