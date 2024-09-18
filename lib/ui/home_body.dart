import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[100], // Light background color for the body
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Image.asset('dash.png'),
              Text(
                'Welcome!',
                style: Theme.of(context).textTheme.displaySmall,
              ),
              const SignOutButton(),
            ],
          ),
        ),
      ),
    );
  }
}
