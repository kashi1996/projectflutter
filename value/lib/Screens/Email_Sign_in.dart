import 'package:flutter/material.dart';

class EmailSignInForm extends StatelessWidget {

  List<Widget> _buildChildren(){
    return[
      TextField(
        decoration: InputDecoration(
          labelText: 'Email',
          hintText: 'test@test.com',
        ),
      ),

      TextField(
        decoration: InputDecoration(
          labelText: 'Password',

        ),
        obscureText: true,
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: _buildChildren()
    );
  }
}
