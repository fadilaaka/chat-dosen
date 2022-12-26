import 'package:chat_dosen/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'pages/splash_screen.dart';
import 'pages/settings_page.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      routes: {
        '/homepage': (context) => const HomePage(),
        '/settings': (context) => const SettingsPages(),
      }));
}
