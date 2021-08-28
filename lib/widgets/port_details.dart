import 'package:flutter/material.dart';
import 'package:flutter_libserialport/flutter_libserialport.dart';
import 'package:flutter_serial/providers/port_provider.dart';
import 'package:provider/provider.dart';

extension IntToString on int {
  String toHex() => '0x${toRadixString(16)}';
  String toPadded([int width = 3]) => toString().padLeft(width, '0');
  String toTransport() {
    switch (this) {
      case SerialPortTransport.usb:
        return 'USB';
      case SerialPortTransport.bluetooth:
        return 'Bluetooth';
      case SerialPortTransport.native:
        return 'Native';
      default:
        return 'Unknown';
    }
  }
}

class PortDetails extends StatelessWidget {
  const PortDetails({ Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final _port = context.watch<SerialPorts>().selectedPort;
    final port;
    if (_port != null ){
      port = SerialPort(_port);
    } else { port = null;}
    return  _port != null  ?
      Card(
        child: ExpansionTile(
          title: Text(port.name! + '   Details'),
          children: [
            CardListTile('Description', port.description),
            // CardListTile('Transport', port.transport.toTransport()),
            // CardListTile('USB Bus', port.busNumber?.toPadded()),
            // CardListTile('USB Device', port.deviceNumber?.toPadded()),
            // CardListTile('Vendor ID', port.vendorId?.toHex()),
           // CardListTile('Product ID', port.productId?.toHex()),
            CardListTile('Manufacturer', port.manufacturer),
            CardListTile('Product Name', port.productName),
            CardListTile('Serial Number', port.serialNumber),
            CardListTile('MAC Address', port.macAddress),
          ],
        ),

    )
        : SizedBox(
      child: Text('No Port Selected'),
    );
  }
}


class CardListTile extends StatelessWidget {
  final String name;
  final String? value;

  CardListTile(this.name, this.value);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(value ?? 'N/A'),
        subtitle: Text(name),
      ),
    );
  }
}