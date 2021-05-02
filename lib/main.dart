import 'package:covid/routes/safety.dart';
import 'package:covid/routes/splash.dart';
import 'package:covid/routes/treatment.dart';
import 'package:flutter/material.dart';

import 'package:covid/routes/home.dart';
import 'package:covid/routes/symptoms.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coronavirus Tracker',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => Splash(),
        '/home': (context) => Home(),
        '/symptoms': (context) => Symptoms(),
        '/safety': (context) => Safety(),
        '/treatment': (context) => Treatment()
      },
    );
  }
}
