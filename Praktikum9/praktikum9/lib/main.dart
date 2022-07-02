import 'package:flutter/material.dart';
import 'package:praktikum9/Constant/ConstantColor.dart';
import 'package:praktikum9/Constant/User.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
            backgroundColor: warnaDasarAppBar,
            foregroundColor: warnaTulisanAppBar),
        colorScheme:
            ColorScheme.fromSwatch(primarySwatch: Colors.blue).copyWith(
          secondary: warnaTombol,
        ),
        textTheme: const TextTheme(
            bodyText2: TextStyle(color: Colors.black),
            headline6: TextStyle(color: Colors.red)),
      ),
      debugShowCheckedModeBanner: false,
      title: "Latihan HTTP",
      home: User(),
    );
  }
}
