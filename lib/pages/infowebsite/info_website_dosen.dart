import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class InfoWebsiteDosen extends StatefulWidget {
  const InfoWebsiteDosen({super.key});
  @override
  _InfoWebsiteState createState() => _InfoWebsiteState();
}

class _InfoWebsiteState extends State<InfoWebsiteDosen> {
  final String apiUrl = "https://retoolapi.dev/QbmiN5/APIChatDosen";
  Future<List<dynamic>> getData() async {
    var response = await http.get(Uri.parse(apiUrl));
    return jsonDecode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Info Website"),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed("/homedosen");
            },
          ),
          backgroundColor: const Color(0xff4b6367),
        ),
        body: FutureBuilder<List<dynamic>>(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                padding: const EdgeInsets.all(10),
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text("${snapshot.data![index]["Website"]}"),
                    subtitle: Text("${snapshot.data![index]["Rating"]}"),
                  );
                },
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ));
  }
}
