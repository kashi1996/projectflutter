

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testingcode/Screens/EmailLogin.dart';
import 'package:testingcode/Services/Auth.dart';
import '../Widgets/CustomRaisedButton.dart';



class SignInPage extends StatelessWidget {

  SignInPage({@required this.auth});

  final AuthBase auth;


  Future<void> _signInAnonymous() async {
    try {
      await auth.signInAnonymously();


    }
    catch (e) {
      print(e.toString());
    }
  }

  Future<void> _signInGoogle() async {
    try {
      await auth.signInWithGoogle();


    }
    catch (e) {
      print(e.toString());
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Time Tracker'),
        elevation: 10.0,
      ),
      body: _bodyContent(context),


    );

  }

  void _signInWithEmail(BuildContext context){
    Navigator.of(context).push;{
      MaterialPageRoute<void>(
        fullscreenDialog: true,
        builder: (context) => EmailLogin(),
      );
      print ('done');

    }
  }

  Widget _bodyContent(BuildContext context){

    return Padding(
      padding: EdgeInsets.all(10.0),

      child: Column(

        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[

          Text('Sign in',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 32.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          CustomRaisedButton(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Image.asset('images/google-logo.png'),
                Text(
                  'Sign in with Google',style: TextStyle(
                    color: Colors.black,
                    fontSize: 15
                ),
                ),
                Opacity(
                  opacity: 0.0,
                  child:
                  Image.asset('images/google-logo.png'),

                ),
              ],
            ),

            color: Colors.white,
            onPressed:_signInGoogle,
            borderRadius: 4.0,

          ),
          SizedBox(
            height: 8.0,
          ),


          CustomRaisedButton(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Image.asset('images/facebook-logo.png'),
                Text(
                  'Sign in with Facebook',style: TextStyle(
                    color: Colors.white,
                    fontSize: 15
                ),
                ),
                Opacity(
                  opacity: 0.0,
                  child:
                  Image.asset('images/facebook-logo.png'),

                ),
              ],
            ),

            color: Colors.indigo,
            onPressed:(){} ,
            borderRadius: 4.0,

          ),
          SizedBox(
            height: 8.0,
          ),

          CustomRaisedButton(
            child: Text('Sign in Email',style: TextStyle(
              color: Colors.white,
              fontSize: 15.0,
            ),
            ),
            color: Colors.orange,
            borderRadius: 4.0,
            onPressed: () => _signInWithEmail(context),
          ),


          SizedBox(
            height: 8.0,
          ),

          Text(
            'OR',
            textAlign: TextAlign.center,
          ),


          CustomRaisedButton(
            child: Text('Sign in anonymously',style: TextStyle(
              color: Colors.white,
              fontSize: 15.0,
            ),
            ),
            color: Colors.lime,
            borderRadius: 4.0,
            onPressed: _signInAnonymous,
          ),



        ],
      ),
    );


  }
//  void _signInWithGoogle(){
//   TODO:auth with google
//  }

}

//


//  void _signInGoogle() async{
//    final authResult = await FirebaseAuth.instance.signInGoogle();
//    print ('${authResult.user.uid}');
//  }

