import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserAppBar extends StatelessWidget implements PreferredSizeWidget {
  final User? user;

  const UserAppBar({super.key, this.user});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.grey, // Different background color for AppBar
      title: const Text('Salon Management'), // Application name
      toolbarHeight: 80, // Adjust height to make the AppBar slightly bigger
      actions: [
        if (user != null)
          Row(
            children: [
              if (user!.displayName != null)
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome, ${user!.displayName!}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () async {
                              // Logout logic
                              await FirebaseAuth.instance.signOut();
                              Navigator.of(context).pushReplacementNamed(
                                  '/login'); // Replace with your login route
                            },
                            child: const Text(
                              'Log out',
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 14,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                          const SizedBox(
                              width: 4), // Space between text and icon
                          IconButton(
                            icon: const Icon(Icons.logout, color: Colors.blue),
                            onPressed: () async {
                              // Logout logic
                              await FirebaseAuth.instance.signOut();
                              Navigator.of(context).pushReplacementNamed(
                                  '/login'); // Replace with your login route
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              // Display the user's profile image as a clickable avatar
              IconButton(
                icon: CircleAvatar(
                  backgroundImage: NetworkImage(
                    user!.photoURL ?? 'https://example.com/default_avatar.png',
                  ),
                  radius: 20,
                ),
                onPressed: () {
                  // Implement navigation to the user profile page
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UserProfileScreen(
                          user: user), // Navigate to the UserProfileScreen
                    ),
                  );
                },
              ),
            ],
          ),
      ],
    );
  }

  @override
  Size get preferredSize =>
      const Size.fromHeight(80); // Increase AppBar height to 80
}

// Example of a User Profile Screen (replace with your actual screen implementation)
class UserProfileScreen extends StatelessWidget {
  final User? user;

  const UserProfileScreen({super.key, this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("User Profile")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(user != null ? 'Name: ${user!.displayName}' : 'No User'),
            Text(user != null ? 'Email: ${user!.email}' : 'No Email'),
          ],
        ),
      ),
    );
  }
}
