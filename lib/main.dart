import 'package:flutter/material.dart';
import 'package:flutter_tugas_akhir_prakerja/screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tugas Prakerja',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF075E54),
        ),
        primaryColor: const Color(0xFF075E54),
        hintColor: const Color(0xFF128C7E),
        colorScheme: ThemeData().colorScheme.copyWith(
              secondary: const Color(0xFF075E54),
            ),
      ),
      home: const HomeScreen(),
    );
  }
}
