import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the current user
    User? user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey, // Different background color for AppBar
        title: const Text('Salon Management'), // Application name
        actions: [
          if (user != null)
            Row(
              children: [
                // Display the welcome message and user's display name
                if (user.displayName != null)
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Text(
                      'Welcome, ${user.displayName!}',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                // Display the user's profile image as a clickable avatar
                IconButton(
                  icon: CircleAvatar(
                    backgroundImage: NetworkImage(
                      user.photoURL ?? 'https://example.com/default_avatar.png',
                    ),
                    radius: 20,
                  ),
                  onPressed: () {
                    // Navigate to the user profile screen
                    Navigator.push(
                      context,
                      MaterialPageRoute<ProfileScreen>(
                        builder: (context) => ProfileScreen(
                          appBar: AppBar(
                            title: const Text('User Profile'),
                          ),
                          actions: [
                            SignedOutAction((context) {
                              Navigator.of(context).pop();
                            }),
                          ],
                          children: [
                            const Divider(),
                            Padding(
                              padding: const EdgeInsets.all(2),
                              child: AspectRatio(
                                aspectRatio: 1,
                                child: Image.asset('flutterfire_300x.png'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.deepPurple, // Drawer header background color
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundImage: user != null && user.photoURL != null
                        ? NetworkImage(user.photoURL!)
                        : const AssetImage('assets/default_user.png')
                            as ImageProvider,
                    radius: 30,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    user != null && user.displayName != null
                        ? user.displayName!
                        : 'User Name',
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  Text(
                    user != null ? user.email! : 'user@example.com',
                    style: const TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                // Add navigation logic here
              },
            ),
            ListTile(
              leading: const Icon(Icons.calendar_today),
              title: const Text('Appointments'),
              onTap: () {
                Navigator.pop(context);
                // Add navigation logic here
              },
            ),
            ListTile(
              leading: const Icon(Icons.people),
              title: const Text('Clients'),
              onTap: () {
                Navigator.pop(context);
                // Add navigation logic here
              },
            ),
            ListTile(
              leading: const Icon(Icons.design_services),
              title: const Text('Services'),
              onTap: () {
                Navigator.pop(context);
                // Add navigation logic here
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Stylists'),
              onTap: () {
                Navigator.pop(context);
                // Add navigation logic here
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                Navigator.pop(context);
                // Add navigation logic here
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () async {
                await FirebaseAuth.instance.signOut(); // Log out the user
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Container(
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
      ),
    );
  }
}
