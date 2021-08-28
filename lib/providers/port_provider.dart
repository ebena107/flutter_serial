
import 'package:flutter/material.dart';
import 'package:flutter_libserialport/flutter_libserialport.dart';


class SerialPorts extends ChangeNotifier{

  var _selectedPort;

  var _availablePorts = SerialPort.availablePorts;



get availablePorts => _availablePorts;
get selectedPort => _selectedPort;

void portChange(var address){
  _selectedPort = address;
  notifyListeners();
}

}