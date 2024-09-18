import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  final User? user;

  const CustomDrawer({super.key, this.user});

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
                  backgroundImage: user != null && user!.photoURL != null
                      ? NetworkImage(user!.photoURL!)
                      : const AssetImage('assets/default_user.png')
                          as ImageProvider,
                  radius: 30,
                ),
                const SizedBox(height: 10),
                Text(
                  user != null && user!.displayName != null
                      ? user!.displayName!
                      : 'User Name',
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),
                Text(
                  user != null ? user!.email! : 'user@example.com',
                  style: const TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),
          buildDrawerItem(Icons.home, 'Home', context),
          buildDrawerItem(Icons.calendar_today, 'Appointments', context),
          buildDrawerItem(Icons.people, 'Clients', context),
          buildDrawerItem(Icons.design_services, 'Services', context),
          buildDrawerItem(Icons.person, 'Stylists', context),
          const Divider(),
          buildDrawerItem(Icons.settings, 'Settings', context),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () async {
              await FirebaseAuth.instance.signOut(); // Log out the user
              Navigator.pop(context);
              // Add navigation logic to go back to login screen
            },
          ),
        ],
      ),
    );
  }

  ListTile buildDrawerItem(IconData icon, String title, BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () {
        Navigator.pop(context); // Close the drawer
        // Add navigation logic here
      },
    );
  }
}
