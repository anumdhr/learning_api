import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class APIScreen extends StatefulWidget {
  const APIScreen({Key? key}) : super(key: key);

  @override
  State<APIScreen> createState() => _APIScreenState();
}

class _APIScreenState extends State<APIScreen> {
  List<dynamic> data = [];

  Future<void> getData() async {
    const url = "https://6465c6c6228bd07b35523830.mockapi.io/anu";
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final decodeData = jsonDecode(body);
    setState(() {
      data = decodeData;
    });
  }
  @override
  void initState() {
  getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: getData,
        label: const Text('fetch'),
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          final datas = data[index];
          final name = datas['name'];
          final createdAt = datas['createdAt'];
          final avatar = datas['avatar'];
          final id = datas['id'];
          return Column(
            children: [
              Image.network(avatar),
              Text(name),
              Text(createdAt),
              Text(id),
              SizedBox(
                height: 30,
              ),
            ],
          );
        },
      ),
    );
  }
}
