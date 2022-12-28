import 'package:chat_dosen/pages/home/home_mahasiswa.dart';
import 'package:chat_dosen/pages/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:chat_dosen/firebase_options.dart';
import 'package:chat_dosen/pages/chat/chat_mahasiswa.dart';
import 'package:chat_dosen/pages/home_page.dart';
import 'package:chat_dosen/pages/login/menu_login.dart';
import 'package:flutter/material.dart';
import 'pages/settings_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    // Initialization code goes here
    Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
        .whenComplete(() {
      print("Compelete initialized Firebase");
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: "/",
        routes: {
          '/': (context) => const SplashScreen(),
          '/homepage': (context) => const HomePage(),
          '/settings': (context) => const SettingsPages(),
          '/loginmenu': (context) => const LoginMenu(),
          '/homemahasiswa': (context) => const HomeMahasiswa(),
          '/chat': (context) => const ChatMahasiswa()
        });
  }
}
