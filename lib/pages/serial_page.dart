import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_serial/widgets/port_selector.dart';


class SerialPage extends StatelessWidget {
  // const SerialPage({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xffedf4ff), Color(0xff8fb2c9)])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
           // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              PortSelector(),
              Expanded(child: SizedBox()),
              Expanded(child: SizedBox()),
              Expanded(child: SizedBox())
            ],
          ),
        ),
      ),
    );
  }
}

