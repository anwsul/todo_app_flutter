import 'package:flutter/material.dart';
import 'package:todo_app_flutter/pages/home_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Colors.black,
          selectionColor: Color.fromARGB(255, 212, 209, 209),
        ),
      ),
      home: const HomePage(),
    );
  }
}
