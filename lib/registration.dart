import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'homepage.dart';

class RegistrationScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            controller: fullNameController,
            decoration: InputDecoration(
              labelText: "Fullname",
            ),
          ),
          TextField(
            controller: emailController,
            decoration: InputDecoration(
              labelText: "Email",
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
            child: Text('Register'),
            onPressed: () async {
              try {
                UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                    email: emailController.text,
                    password: passwordController.text
                );
                
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MainPage()),
                );
              } on FirebaseAuthException catch (e) {
                if (e.code == 'weak password') {
                  print('The password seems insecure.');
                } else if (e.code == 'email-already-in-use') {
                  print('The account already exists.');
                }
              } catch (e) {
                print(e);
              }
            },
          ),
        ],
      ),
    );
  }
}
