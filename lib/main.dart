import 'package:api/api_screen/new_screen.dart';
import 'package:api/fakestore/apie_screen.dart';
import 'package:flutter/material.dart';

import 'api_screen/api_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ApieScreen(),
    );
  }
}
