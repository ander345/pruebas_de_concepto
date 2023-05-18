import 'package:authentication/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String email;
  String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50.0),
              child: TextField(
                decoration: InputDecoration(hintText: 'Email'),
                onChanged: (value) {
                  setState(() => email = value);
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50.0),
              child: TextField(
                decoration: InputDecoration(hintText: 'Password'),
                onChanged: (value) {
                  setState(() => password = value);
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            FlatButton(
              color: Colors.blue,
              child: Text("Register"),
              onPressed: () async {
                AuthService auth = AuthService();
                UserCredential credential =
                    await auth.register(email, password);
                if (credential.user != null) {
                  print("USUARIO REGISTRADO");
                } else {
                  print("USUARIO NO REGISTRADO");
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
