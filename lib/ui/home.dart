import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'user_app_bar.dart';
import 'custom_drawer.dart';
import 'home_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the current user
    User? user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: UserAppBar(user: user), // Refactored app bar with user info
      drawer: CustomDrawer(user: user), // Refactored custom drawer
      body: const HomeBody(), // Refactored home body content
    );
  }
}
