import 'dart:convert';
import 'package:chat_dosen/pages/login/menu_login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginMahasiswa extends StatefulWidget {
  const LoginMahasiswa({super.key});
  @override
  _LoginMahasiswaState createState() => _LoginMahasiswaState();
}

class _LoginMahasiswaState extends State<LoginMahasiswa> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final TextEditingController _nimController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> loginUser(String nim, String password) async {
    try {
      QuerySnapshot snapshot = await _firestore
          .collection("users_mahasiswa")
          .where("nim", isEqualTo: nim)
          .where("password", isEqualTo: password)
          .get();

      DocumentSnapshot userDocument = snapshot.docs.first;
      print("ID: ${userDocument.id}");
      print("NIM: ${userDocument.get('nim')}");
      print("Name: ${userDocument.get('nama')}");
      print("Role: ${userDocument.get('role')}");
      print("Password: ${userDocument.get('password')}");

      Map dataUser = {
        "id": userDocument.id,
        "nama": userDocument.get("nama"),
        "nim": userDocument.get("nim"),
        "role": userDocument.get("role"),
      };

      final prefs = await SharedPreferences.getInstance();
      prefs.setString("localuser", jsonEncode(dataUser));

      print("Ini snapshot : $snapshot");
      print("Ini user document : $userDocument");

      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
                title: const Text("Sukses"),
                content: const Text("Login berhasil!"),
                actions: <Widget>[
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.of(context)
                          .pushReplacementNamed("/homemahasiswa");
                    },
                    child: const Text("Ok"),
                  )
                ]);
          });
    } catch (error) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Error"),
              content: Text(error.toString()),
              actions: <Widget>[
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("Ok"),
                )
              ],
            );
          });
    }
  }

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
                          builder: (context) => const LoginMenu()));
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
                child: Image.asset("images/loginillustration.png"),
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
                          "NIM",
                          style: GoogleFonts.nunito(
                            textStyle: const TextStyle(
                                fontSize: 16,
                                color: Color(0xFF4b6e67),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Row(children: [
                          Expanded(
                            child: TextField(
                              style: const TextStyle(fontSize: 16),
                              controller: _nimController,
                              decoration: const InputDecoration(
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
                        Row(children: [
                          Expanded(
                            child: TextField(
                              style: const TextStyle(fontSize: 16),
                              obscureText: true,
                              controller: _passwordController,
                              decoration: const InputDecoration(
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
                String nim = _nimController.text;
                String password = _passwordController.text;
                loginUser(nim, password);
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
                    "Login",
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
