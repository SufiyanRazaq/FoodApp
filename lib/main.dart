import 'package:flutter/material.dart';
import 'package:widgets/Views/home_page.dart';

import 'utils/color_theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Delivery App',
      debugShowCheckedModeBanner: false,
      theme: colorTheme,
      home: HomePage(),
    );
  }
}
