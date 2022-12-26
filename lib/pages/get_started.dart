import 'package:flutter/material.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/backgroundGetStarted.png'),
            alignment: Alignment.center,
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Text('Some description'),
            FloatingActionButton(
              onPressed: () {
                // Tambahkan aksi yang ingin dilakukan ketika tombol ditekan
              },
              child: const Text('Get Started'),
            ),
          ],
        ),
      ),
    );
  }
}
