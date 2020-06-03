import 'package:flutter/material.dart';
import 'package:testingcode/Services/Auth.dart';

class HomePage extends StatelessWidget {

  HomePage({@required this.auth});
  final AuthBase auth;
  Future<void> _signOut() async {
    try {
      auth.signOut();

    }
    catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('HomePage'),

        actions: <Widget>[
          FlatButton(
            child: Text('Logout'),
            onPressed: _signOut,
          ),
        ],
      ),

    );
  }
}
