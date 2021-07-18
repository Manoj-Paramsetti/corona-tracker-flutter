import 'package:covid/widget/text.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 8), () {
      // 5s over, navigate to a new page
      Navigator.popAndPushNamed(context, '/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var width = screenSize.width;
    var height = screenSize.height;
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: height,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  width: 150.0,
                  fit: BoxFit.fitWidth,
                  image: AssetImage("assets/logo.png"),
                ),
                TextMainNormal('\nCOVID-19 Tracker App', 18)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
