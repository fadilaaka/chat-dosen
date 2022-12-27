import 'package:flutter/material.dart';

class ChatMahasiswa extends StatefulWidget {
  const ChatMahasiswa({super.key});
  @override
  _ChatMahasiswaState createState() => _ChatMahasiswaState();
}

class _ChatMahasiswaState extends State<ChatMahasiswa> {
  final List<Message> _messages = [
    Message(sender: 'Pengirim', text: 'Halo, apa kabar?'),
    Message(sender: 'Penerima', text: 'Halo, kabar baik. Kamu?'),
    Message(sender: 'Pengirim', text: 'Saya juga baik. Terima kasih.'),
  ];
  @override
  Widget build(BuildContext context) {
    final Object? id = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text("Pak $id"),
          backgroundColor: const Color(0xff4b6367),
        ),
        body: Column(
          children: [
            Flexible(
              child: ListView.builder(
                itemCount: _messages.length,
                itemBuilder: (BuildContext context, int index) {
                  final message = _messages[index];
                  final isSender = message.sender == "Pengirim";
                  return Align(
                    alignment:
                        isSender ? Alignment.centerLeft : Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Card(
                        color: isSender ? Colors.grey[300] : Colors.green[100],
                        child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Text(message.text)),
                      ),
                    ),
                  );
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
                          controller: TextEditingController(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: InkWell(
                            onTap: () {
                              print("ini ontap widget");
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
  final String text;

  Message({required this.sender, required this.text});
}
