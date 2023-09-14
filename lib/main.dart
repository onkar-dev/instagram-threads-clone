import 'package:flutter/material.dart';
import 'package:threads/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.light,
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.black,
        canvasColor: Colors.black,
      ),
      themeMode: ThemeMode.dark,
      home: const HomeScreen(),
    );
  }
}
