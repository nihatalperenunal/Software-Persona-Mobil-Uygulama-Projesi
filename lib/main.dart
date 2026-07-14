import 'package:flutter/material.dart';
import 'home_screen.dart';

void main() {
  runApp(const NeonKatalogApp());
}

class NeonKatalogApp extends StatelessWidget {
  const NeonKatalogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Neon Katalog',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          foregroundColor: Colors.cyanAccent,
          elevation: 0,
        ),
        colorScheme: ColorScheme.dark(
          primary: Colors.cyanAccent,
          secondary: Colors.blueAccent,
          surface: Colors.grey.shade900,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}