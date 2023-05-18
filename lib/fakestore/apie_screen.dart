import 'dart:convert';

import 'package:api/fakestore/apie_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApieScreen extends StatefulWidget {
  const ApieScreen({Key? key}) : super(key: key);

  @override
  State<ApieScreen> createState() => _ApieScreenState();
}

class _ApieScreenState extends State<ApieScreen> {
  List<ApieModel> dataA = [];

  Future<List<ApieModel>> getData() async {
    const url = "https://fakestoreapi.com/products";
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final decodeData = jsonDecode(body) as List<dynamic>;
    final data = (decodeData.map((e) => ApieModel.fromJson(e))).toList();

    setState(() {
      dataA = data;
    });
    return data;
  }
  @override
  void initState() {
   getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
          itemCount: dataA.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Text(dataA[index].rating.rate.toString()),
              ],
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: getData,
        ));
  }
}
