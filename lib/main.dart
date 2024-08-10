import 'package:bmi_calculator/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/pages/view_detail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/homepage',
      routes: {
        HomePage.routeName: (context) => HomePage(),
        ViewDetail.routeName: (context) => ViewDetail(),
      },
    );
  }
}

