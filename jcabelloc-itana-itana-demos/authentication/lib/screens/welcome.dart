import 'package:authentication/screens/login.dart';
import 'package:authentication/screens/register.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FlatButton(
            child: Text("Login"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
            color: Colors.blue,
          ),
          SizedBox(
            height: 10,
          ),
          FlatButton(
            child: Text("Register"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RegisterScreen()),
              );
            },
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}
