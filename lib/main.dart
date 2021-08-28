import 'package:flutter/material.dart';
import 'package:flutter_serial/pages/serial_page.dart';
import 'package:flutter_serial/providers/port_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
      MultiProvider(
          providers: [
           // Provider<SerialPorts>(create: (_) => SerialPorts()),
            ChangeNotifierProvider(create: (_) => SerialPorts())
          ],
          child: MyApp()));
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


