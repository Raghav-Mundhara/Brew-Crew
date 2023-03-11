import 'package:brew_crew/Services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        title: Text(
          'Home Page',
        ),
        backgroundColor: Colors.brown,
        actions: [
          TextButton.icon(
            onPressed: () async {
              await _auth.signOut();
            },
            icon: Icon(Icons.logout_rounded),
            label: Text('Logout'),
          ),
        ],
      ),
    );
  }
}
