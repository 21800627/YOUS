
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Future _logout() async{
    return await FirebaseAuth.instance.signOut();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          children: [
            Icon(
              Icons.audiotrack,
              color: Colors.green,
              size: 100.0,
            ),
            Text(
              'Welcome!',
              style: Theme.of(context).textTheme.displaySmall,
            ),
            ElevatedButton(onPressed: _logout, child: Text('LOGOUT'))
          ],
        ),
      ),
    );
  }
}