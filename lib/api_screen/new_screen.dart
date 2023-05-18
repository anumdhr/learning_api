import 'dart:convert';

import 'package:api/api_screen/api_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  List<ApiModel> dataA = [];

  Future<List<ApiModel>> getData() async {
    print('started');
    const url = "https://6465c6c6228bd07b35523830.mockapi.io/anu";
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final decodeData = jsonDecode(body) as List<dynamic>;
    final data = (decodeData.map((e) => ApiModel.fromJson(e))).toList();
    setState(() {
      dataA = data;
    });
    print('end');
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: dataA.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Text(dataA[index].name),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getData,
      ),
    );
  }
}
