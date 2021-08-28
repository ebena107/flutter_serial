import 'package:flutter/material.dart';
import 'package:flutter_serial/providers/port_provider.dart';
import 'package:provider/provider.dart';

class PortSelector extends StatelessWidget {
  const PortSelector({
    Key? key,

  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    final  availablePorts = context.watch<SerialPorts>().availablePorts;
    return DropdownButtonHideUnderline(
      child: Container(
        height: 32,
        width: 124,
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 0.5, style: BorderStyle.solid),
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
        ),
        child: DropdownButton(
          value: context.read<SerialPorts>().selectedPort,
          icon: Icon(Icons.arrow_downward),
          iconSize: 24.0, // can be changed, default: 24.0
          iconEnabledColor: Colors.blue,
          items: availablePorts
              .map<DropdownMenuItem<Object>>((e) => new DropdownMenuItem(
            child: new Text(e),
            value: e,
          ))
              .toList(),
          onChanged: (value) {
            context.read<SerialPorts>().portChange(value);
            print(context.read<SerialPorts>().selectedPort);
          },
          hint: Text("Select Port"),
        ),
      ),
    );
  }
}
