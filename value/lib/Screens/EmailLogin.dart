import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testingcode/Screens/Email_Sign_in.dart';



class EmailLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign in'),
        elevation: 10.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
            child: EmailSignInForm(),
        ),
      ),
      backgroundColor: Colors.grey,
    );
  }

}




