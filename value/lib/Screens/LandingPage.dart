import 'package:flutter/material.dart';
import 'package:testingcode/Screens/HomePage.dart';
import 'package:testingcode/Screens/app_sign_in.dart';
import 'package:testingcode/Services/Auth.dart';

class LandingPage extends StatelessWidget {
  final AuthBase auth;

  const LandingPage({Key key,@required this.auth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: auth.onAuthStateChanged,
      builder: (context, snapshot){
        if (snapshot.connectionState==ConnectionState.active){
          User user = snapshot.data;
          if (user == null) {
            return SignInPage(
              auth: auth,

            );
          }
          else{
            return HomePage(
              auth: auth,
            );
          }
        }
        else{
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );


  }
}
