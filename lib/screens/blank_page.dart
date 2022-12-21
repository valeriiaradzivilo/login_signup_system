import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:login_signup_system/services/auth.dart';
import 'package:firebase_database/firebase_database.dart';

class BlankPage extends StatefulWidget {
  const BlankPage({super.key});

  @override
  State<BlankPage> createState() => BlankPageState();
}

class BlankPageState extends State<BlankPage> {

  final AuthService _auth = AuthService();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 147, 149, 211),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 147, 149, 211),
          elevation: 0.0,
          actions: [
            ElevatedButton.icon(
              onPressed: () async {
                await _auth.signOut();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
              ),
              label: Text("Sign out"),
              icon: Icon(Icons.person_off),
            )
          ],
        ),
        body:
    Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text("You are successcully signed in", style: TextStyle(fontSize: 50),
          textAlign: TextAlign.center,),
        ],
      ),
    )
    );
  }
}
