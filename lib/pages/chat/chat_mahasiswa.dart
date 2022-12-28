import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatMahasiswa extends StatefulWidget {
  const ChatMahasiswa({super.key});
  @override
  _ChatMahasiswaState createState() => _ChatMahasiswaState();
}

final String formattedDate = DateFormat.yMd().format(DateTime.now());
final String formattedTime = DateFormat.Hm().format(DateTime.now());

class _ChatMahasiswaState extends State<ChatMahasiswa> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final TextEditingController _pesanController = TextEditingController();
  String? idMahasiswa;

  final List<Message> _messages = [
    Message(
        sender: 'mahasiswa',
        text: 'Halo, apa kabar?',
        receiver: 'dosen',
        timestamp: '$formattedDate - $formattedTime'),
    Message(
        sender: 'dosen',
        text: 'Halo, kabar baik. Kamu?',
        receiver: 'mahasiswa',
        timestamp: '$formattedDate - $formattedTime'),
    Message(
        sender: 'mahasiswa',
        text: 'Saya juga baik. Terima kasih.',
        receiver: 'dosen',
        timestamp: '$formattedDate - $formattedTime'),
  ];

  @override
  void initState() {
    super.initState();
    getLocalUser().then((value) => {
          setState(() {
            print("Ini value local : $value");
            Map<String, dynamic> decodedValue = jsonDecode(value!);
            print("Ini id mahasiswa local : ${decodedValue['id']}");
            idMahasiswa = decodedValue['id'];
          })
        });
  }

  Future<String?> getLocalUser() async {
    // Get the instance of SharedPreferences
    final prefs = await SharedPreferences.getInstance();

    // Read a value
    return prefs.getString('localuser');
  }

  Future<void> sendMessage(
      String message, String idMahasiswa, String idDosen) async {
    try {
      _firestore
          .collection("messages")
          .doc('${idMahasiswa}_$idDosen')
          .collection("isipesan")
          .add({
        "sender": idMahasiswa,
        "text": message,
        "receiver": idDosen,
        "timestamp": '$formattedDate - $formattedTime'
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
    String? idDosen = ModalRoute.of(context)!.settings.arguments as String?;

    return Scaffold(
        appBar: AppBar(
          title: StreamBuilder(
            stream:
                _firestore.collection("users_dosen").doc(idDosen).snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                DocumentSnapshot user =
                    snapshot.data as DocumentSnapshot<Object?>;
                return Text("${user['nama']}");
              } else {
                return const Text("Loading...");
              }
            },
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: const Color(0xff4b6367),
        ),
        body: Column(
          children: [
            Flexible(
              child: StreamBuilder(
                stream: _firestore
                    .collection("messages")
                    .doc("${idMahasiswa}_$idDosen")
                    .collection("isipesan")
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data?.docs.length,
                      itemBuilder: (context, index) {
                        final isSender =
                            snapshot.data?.docs[index]["sender"] == idMahasiswa;
                        final text = snapshot.data?.docs[index]["text"];
                        final timestamp =
                            snapshot.data?.docs[index]["timestamp"];
                        return Align(
                          alignment: isSender
                              ? Alignment.centerRight
                              : Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Card(
                              color: isSender
                                  ? Colors.green[100]
                                  : Colors.grey[300],
                              child: Column(
                                children: [
                                  Padding(
                                      padding: const EdgeInsets.all(16),
                                      child: Text(text)),
                                  Text(timestamp)
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: const InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.all(12),
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFF4B6E67))),
                          ),
                          controller: _pesanController,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: InkWell(
                            onTap: () {
                              String message = _pesanController.text;
                              print("ini ontap widget");
                              sendMessage(message, idMahasiswa!, idDosen!);
                              _pesanController.clear();
                            },
                            child: const Icon(Icons.send)),
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ));
  }
}

class Message {
  final String sender;
  final String receiver;
  final String text;
  final String timestamp;

  Message(
      {required this.sender,
      required this.text,
      required this.receiver,
      required this.timestamp});
}
