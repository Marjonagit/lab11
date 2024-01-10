import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lab11/registration.dart';

import 'homepage.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        leading: Icon(Icons.login),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            controller: emailController,
            decoration: InputDecoration(
              labelText: "Username",
            ),
          ),
          TextField(
            controller: passwordController,
            decoration: InputDecoration(
              labelText: "Password",
            ),
            obscureText: true,
          ),
          ElevatedButton(
            child: Text('Sign in'),
            onPressed: () async {
              try {
                UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                    email: emailController.text,
                    password: passwordController.text
                );
                
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MainPage()),
                );
              } on FirebaseAuthException catch (e) {
                if (e.code == 'not found') {
                  print('No user exists in this email.');
                } else if (e.code == 'wrong-password') {
                  print('Wrong password.');
                }
              }
            },
          ),
          ElevatedButton(
            child: Text('Sign up'),
            onPressed: () {
              
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RegistrationScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
