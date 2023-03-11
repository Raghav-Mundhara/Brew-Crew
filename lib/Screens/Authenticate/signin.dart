import 'package:brew_crew/Services/auth.dart';
import 'package:flutter/material.dart';
import 'package:brew_crew/Services/auth.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('Sign In to Brew Crew'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          child:Column(
            children: [
              SizedBox(height: 20.0,),
              TextFormField(
                onChanged: (val)
                {

                },
              ),
              SizedBox(height: 20.0,),
              TextFormField(
                obscureText: true,
                onChanged: (val){

                },
              ),
              SizedBox(height: 20.0,),
            ],
          ) 
        )
      ),
    );
  }
}
