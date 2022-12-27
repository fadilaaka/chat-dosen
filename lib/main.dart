import 'package:chat_dosen/pages/chat/chat_mahasiswa.dart';
import 'package:chat_dosen/pages/home_page.dart';
import 'package:chat_dosen/pages/login/menu_login.dart';
import 'package:flutter/material.dart';
import 'pages/splash_screen.dart';
import 'pages/settings_page.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        '/': (context) => const SplashScreen(),
        '/homepage': (context) => const HomePage(),
        '/settings': (context) => const SettingsPages(),
        '/loginmenu': (context) => const LoginMenu(),
        '/chat': (context) => const ChatMahasiswa()
      }));
}
