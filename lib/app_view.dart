import 'package:flutter/material.dart';
import 'package:project/screens/home/home_screen.dart';


class MyAppveiw extends StatelessWidget {
  const MyAppveiw({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Expense App',
      theme: ThemeData(
        colorScheme: ColorScheme.light(
          surface: Colors.grey.shade200, // สีพื้นหลัง background = surface
          onSurface: Colors.black, // สีตัวอักษรบนพื้นหลัง onBackground = onSurface
          primary: const Color(0xFF0D47A1),
          secondary: const Color(0xFF1565C0),
          tertiary: const Color(0xFF1976D2),
          outline: Colors.grey.shade600,
        )
      ),
      home: const Homescreen(),
    );
  }
}