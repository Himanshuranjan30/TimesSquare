import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        // statusBarIconBrightness: Brightness.dark,
      ),
    );
    _navigateToHome(context);
    return Image.asset(
      'assets/splash.jpg',
      fit: BoxFit.cover,
    );
  }

  void _navigateToHome(
    BuildContext context,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    Timer(Duration(seconds: 2), () async {
      bool isdemoover = prefs.getBool('isdemoover') ?? false;
      prefs.setBool('isdemoover', true);
      Navigator.of(context).popAndPushNamed('/intro', arguments: isdemoover);
    });
  }
}
