import 'package:flutter/material.dart';
import 'package:my_flutter/screen/home.dart';
import 'package:my_flutter/screen/otp.dart';
import 'package:my_flutter/screen/register.dart';
import 'package:my_flutter/screen/login.dart';
import 'package:my_flutter/screen/maphome.dart';
import 'package:my_flutter/screen/setting.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen());
  }
}
