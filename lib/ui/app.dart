import 'package:flutter/material.dart';
import 'auth_gate.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'NotoSans', // Set the default font family to NotoSans
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        textTheme: const TextTheme(
          // Apply custom text styles using Material 3 names
          bodyLarge: TextStyle(fontSize: 16), // Replaces bodyText1
          bodyMedium: TextStyle(fontSize: 14), // Replaces bodyText2
        ),
      ),
      home: const AuthGate(),
    );
  }
}
