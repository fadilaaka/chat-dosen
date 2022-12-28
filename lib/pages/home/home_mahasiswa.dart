import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

const dataTitle = [
  {"id": "1", "title": "ini kartu 1", "from": "Pak IB"},
  {"id": "2", "title": "ini kartu 2", "from": "Pak Aldi"},
  {"id": "3", "title": "ini kartu 3", "from": "Pak Jumadi"}
];

class HomeMahasiswa extends StatefulWidget {
  const HomeMahasiswa({super.key});
  @override
  _HomeMahasiswaState createState() => _HomeMahasiswaState();
}

class _HomeMahasiswaState extends State<HomeMahasiswa> {
  String? nama;
  @override
  void initState() {
    super.initState();
    getLocalUser().then((value) => {
          setState(() {
            print("Ini value local : $value");
            Map<String, dynamic> decodedValue = jsonDecode(value!);
            print("Ini nama local : ${decodedValue['nama']}");
            nama = decodedValue['nama'];
          })
        });
  }

  Future<String?> getLocalUser() async {
    // Get the instance of SharedPreferences
    final prefs = await SharedPreferences.getInstance();

    // Read a value
    return prefs.getString('localuser');
  }

  Future<Future<bool>> removeLocalUser() async {
    // Get the instance of SharedPreferences
    final prefs = await SharedPreferences.getInstance();

    // Read a value
    return prefs.remove('localuser');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Image.asset(
            'images/backgroundhome.png',
            fit: BoxFit.fill,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.person_pin_circle),
                  Text(
                    "Hi, $nama",
                    style: GoogleFonts.nunito(
                        textStyle:
                            const TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
              InkWell(
                onTap: () {
                  removeLocalUser().then((value) => {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                  title: const Text("Sukses"),
                                  content: const Text("Logout berhasil!"),
                                  actions: <Widget>[
                                    InkWell(
                                      onTap: () {
                                        Navigator.of(context).pop();
                                        Navigator.of(context)
                                            .pushReplacementNamed("/loginmenu");
                                      },
                                      child: const Text("Ok"),
                                    )
                                  ]);
                            }),
                      });
                },
                child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(color: Color(0xFFFBFBFB)),
                    child: const Text("Logout")),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: SingleChildScrollView(
            child: Container(
              height: 525,
              width: double.infinity,
              padding: const EdgeInsets.all(24.0),
              decoration: const BoxDecoration(
                  color: Color(0xFFFBFBFB),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24.0),
                      topRight: Radius.circular(24.0))),
              child: Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  child: ListView.builder(
                      itemCount: dataTitle.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () => Navigator.pushNamed(context, "/chat",
                              arguments: "${dataTitle[index]["id"]}"),
                          child: Card(
                              elevation: 2,
                              child: Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: Row(
                                    children: [
                                      const Icon(Icons.person),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin:
                                                const EdgeInsets.only(left: 12),
                                            child: Text(
                                              dataTitle[index]["from"]!,
                                              style: GoogleFonts.nunito(
                                                  textStyle: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
                                          ),
                                          Container(
                                            margin:
                                                const EdgeInsets.only(left: 12),
                                            child: Text(
                                              "ini bagian kartu : ${dataTitle[index]["title"]!}",
                                              style: GoogleFonts.nunito(
                                                  textStyle: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w300)),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ))),
                        );
                      })),
            ),
          ),
        )
      ],
    ));
  }
}
