import 'package:authentication/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
              child: Text("Login"),
              onPressed: () async {
                AuthService auth = AuthService();
                User user = await auth.singIn(email, password);
                if (user != null) {
                  print("USUARIO ENCONTRADO");
                } else {
                  print("USUARIO NO ENCONTRADO");
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
