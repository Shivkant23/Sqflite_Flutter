import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sensorz/DBTest.dart';
import 'package:sensorz/DataTablePage.dart';

void main() => runApp(SensorMain());

class SensorMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sensorz',
      initialRoute: '/',
      routes: {
        '/': (context) => DBTestPage(),
      },
    );
  }
}