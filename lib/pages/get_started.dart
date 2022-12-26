import 'package:chat_dosen/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              'images/backgroundGetStarted.png',
              fit: BoxFit.fill,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 220,
              width: double.infinity,
              padding: const EdgeInsets.all(24.0),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24.0),
                      topRight: Radius.circular(24.0))),
              child: Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Chatting App that Connects Student and Lecturer",
                      style: GoogleFonts.nunito(
                        textStyle: const TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    const Text(
                      "Aplikasi yang memudahkan mahasiswa dalam menghubungi dosen mata kuliah",
                      style: TextStyle(
                          fontSize: 12.0, fontWeight: FontWeight.w300),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16.0),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePage()));
                      },
                      child: Container(
                          margin: const EdgeInsets.only(top: 12),
                          height: 40,
                          width: 300,
                          decoration: const BoxDecoration(
                            color: Color(0xFF4b6e67),
                            borderRadius:
                                BorderRadius.all(Radius.circular(24.0)),
                          ),
                          child: Center(
                              child: Text(
                            "Get Started",
                            style: GoogleFonts.nunito(
                              textStyle: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            textAlign: TextAlign.center,
                          ))),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
