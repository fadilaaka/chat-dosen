import 'package:chat_dosen/pages/login/login_dosen.dart';
import 'package:chat_dosen/pages/login/login_mahasiswa.dart';
import 'package:chat_dosen/pages/registration/menu_registration.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginMenu extends StatelessWidget {
  const LoginMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const LoginDosen()));
          },
          child: Container(
              height: 40,
              width: 300,
              decoration: const BoxDecoration(
                color: Color(0xFF4b6e67),
                borderRadius: BorderRadius.all(Radius.circular(24.0)),
              ),
              child: Center(
                  child: Text(
                "Login as Dosen",
                style: GoogleFonts.nunito(
                  textStyle: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                textAlign: TextAlign.center,
              ))),
        ),
        InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const LoginMahasiswa()));
          },
          child: Container(
              margin: const EdgeInsets.only(top: 16),
              height: 40,
              width: 300,
              decoration: const BoxDecoration(
                color: Color(0xFF4b6e67),
                borderRadius: BorderRadius.all(Radius.circular(24.0)),
              ),
              child: Center(
                  child: Text(
                "Login as Mahasiswa",
                style: GoogleFonts.nunito(
                  textStyle: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                textAlign: TextAlign.center,
              ))),
        ),
        InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const RegistrasiMenu()));
          },
          child: Container(
              margin: const EdgeInsets.only(top: 20),
              child: Center(
                  child: Text(
                "Registrasi Akun",
                style: GoogleFonts.nunito(
                  textStyle: const TextStyle(
                      fontSize: 16,
                      color: Color(0xFF4b6e67),
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline),
                ),
                textAlign: TextAlign.center,
              ))),
        ),
      ]),
    ));
  }
}
