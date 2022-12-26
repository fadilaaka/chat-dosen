import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
        height: 50,
        child: Center(child: Text("123456", style: TextStyle(fontSize: 20))));
  }
}
