import 'package:demo/controller/controller_methods.dart';
import 'package:demo/utils/global.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.blueGrey.shade900,
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Colors.blueGrey.shade800),
            accountName: Text(fauth.currentUser!.displayName.toString()),
            accountEmail: Text(
              fauth.currentUser!.email.toString(),
            ),
            currentAccountPicture: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: (NetworkImage('${fauth.currentUser!.photoURL}')),
                ),
              ),
            ),
          ),
          // const SizedBox(height: 200),

          ListTile(
            onTap: () {
              ControllerMethods.signout();
            },
            leading: const Icon(Icons.logout, color: Colors.white),
            title: Text(
              'Sign Out',
              style: TextStyle(color: Colors.blueGrey.shade100),
            ),
          ),
        ],
      ),
    );
  }
}
