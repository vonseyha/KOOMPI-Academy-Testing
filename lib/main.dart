import 'package:flutter/material.dart';
import 'package:koompi_academy/ui/login.dart';
import 'package:koompi_academy/ui/signup.dart';
import 'package:koompi_academy/ui/splashscreen/splashsreen.dart';

import 'fregementscreen/content.dart';
import 'fregementscreen/mainfregement.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Content(),
    );
  }
}

