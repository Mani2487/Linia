import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({Key? key}) : super(key: key);

  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: OutlinedButton(
        // onPressed: null,
        onPressed: () async {
          await _auth.signOut();
          Navigator.pop(context);
        },
        child: Text('Icons.logout'),
      ),
      body: SafeArea(
        child: Text('Good morning, Sanjeev'),
      ),
    );
  }
}
