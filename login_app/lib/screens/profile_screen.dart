import 'package:flutter/material.dart';
import 'package:login_app/services/auth_service.dart';

class ProfileScreen extends StatelessWidget {
  final String email;
  final String username;
  final List<String> roles;
  final String accessToken;

  ProfileScreen({
    required this.email,
    required this.username,
    required this.roles,
    required this.accessToken,
  });

  final _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    String roleString = roles.join(', ');

    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              await _authService.logout(); // Log out user
              Navigator.pop(context); // Return to login screen
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.person, color: Colors.blueAccent),
              title: Text('Username'),
              subtitle: Text(username),
            ),
            ListTile(
              leading: Icon(Icons.email, color: Colors.blueAccent),
              title: Text('Email'),
              subtitle: Text(email),
            ),
            ListTile(
              leading: Icon(Icons.security, color: Colors.blueAccent),
              title: Text('Roles'),
              subtitle: Text(roleString),
            ),
            SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () async {
                await _authService.logout(); // Log out user
                Navigator.pop(context); // Return to login screen
              },
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}