import 'package:ads6/screens/dashboard.dart';
import 'package:flutter/material.dart';

void main() => runApp(JCBC());

class JCBC extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'JC Basket Conference',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xff000000),
            brightness: Brightness.light,
          ),
        ));
    home:
    Dashboard();
  }
}
