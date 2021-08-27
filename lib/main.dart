import 'package:flutter/material.dart';
import 'package:flutter_serial/pages/serial_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Serial Comm App',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: SerialPage(),
    );
  }
}


