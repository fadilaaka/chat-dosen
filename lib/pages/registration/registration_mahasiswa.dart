import 'package:chat_dosen/pages/login/menu_login.dart';
import 'package:chat_dosen/pages/registration/menu_registration.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegistrasiMahasiswa extends StatelessWidget {
  const RegistrasiMahasiswa({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(
                  left: 20, right: 20, bottom: 20, top: 20),
              child: InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RegistrasiMenu()));
                },
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: Color(0xFF4b6e67),
                  size: 24.0,
                ),
              ),
            ),
            Center(
              child: SizedBox(
                width: 300,
                child: Image.asset("images/registerillustration.png"),
              ),
            ),
            Center(
                child: Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, right: 20.0, top: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Nama",
                          style: GoogleFonts.nunito(
                            textStyle: const TextStyle(
                                fontSize: 16,
                                color: Color(0xFF4b6e67),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Row(children: const [
                          Expanded(
                            child: TextField(
                              style: TextStyle(fontSize: 16),
                              decoration: InputDecoration(
                                  isDense: true,
                                  contentPadding: EdgeInsets.all(8),
                                  border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xFF4b6e67)),
                                  ),
                                  suffixIcon: Icon(Icons.person)),
                            ),
                          )
                        ])
                      ],
                    ))),
            Center(
                child: Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, right: 20.0, top: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "NIM",
                          style: GoogleFonts.nunito(
                            textStyle: const TextStyle(
                                fontSize: 16,
                                color: Color(0xFF4b6e67),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Row(children: const [
                          Expanded(
                            child: TextField(
                              style: TextStyle(fontSize: 16),
                              decoration: InputDecoration(
                                  isDense: true,
                                  contentPadding: EdgeInsets.all(8),
                                  border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xFF4b6e67)),
                                  ),
                                  suffixIcon: Icon(Icons.remember_me)),
                            ),
                          )
                        ])
                      ],
                    ))),
            Center(
                child: Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, right: 20.0, top: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Password",
                          style: GoogleFonts.nunito(
                            textStyle: const TextStyle(
                                fontSize: 16,
                                color: Color(0xFF4b6e67),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Row(children: const [
                          Expanded(
                            child: TextField(
                              style: TextStyle(fontSize: 16),
                              decoration: InputDecoration(
                                  isDense: true,
                                  contentPadding: EdgeInsets.all(8),
                                  border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xFF4b6e67)),
                                  ),
                                  suffixIcon: Icon(Icons.lock)),
                            ),
                          )
                        ])
                      ],
                    ))),
            Center(
                child: InkWell(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const LoginMenu()));
              },
              child: Container(
                  margin:
                      const EdgeInsets.only(top: 10, right: 20.0, left: 20.0),
                  height: 40,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color(0xFF4b6e67),
                    borderRadius: BorderRadius.all(Radius.circular(24.0)),
                  ),
                  child: Center(
                      child: Text(
                    "Registrasi",
                    style: GoogleFonts.nunito(
                      textStyle: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    textAlign: TextAlign.center,
                  ))),
            ))
          ],
        ),
      ),
    );
  }
}
