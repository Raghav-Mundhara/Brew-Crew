import 'package:brew_crew/Screens/Authenticate/register.dart';
import 'package:brew_crew/Services/auth.dart';
import 'package:flutter/material.dart';
import 'package:brew_crew/Services/auth.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;

  SignIn({required this.toggleView});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  //Variables for Email and Password
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('Sign In to Brew Crew'),
        actions: [
          TextButton.icon(
            onPressed: () {
              widget.toggleView();
            },
            icon: Icon(
              Icons.logout_rounded,
              color: Colors.teal,
            ),
            label: Text(
              'Register',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
      body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Form(
            key: _formKey,
            child: Column(
            children: [
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                validator: (val) => val!.isEmpty ? 'Enter an email' : null,
                onChanged: (val) {
                  setState(() {
                    email = val;
                  });
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                validator: (val) => val!.length < 6 ? 'Enter a password 6+ chars long' : null,
                obscureText: true,
                onChanged: (val) {
                  setState(() {
                    password = val;
                  });
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              TextButton(
                onPressed: () async {
                  if(_formKey.currentState!.validate()){
                    dynamic result=await _auth.signInWithEmailAndPassword(email, password);
                    if(result == null) {
                      setState(() {
                        error = 'Invalid Credentials';
                      });
                    }
                  }
                },
                child: Text(
                  'Sign In',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.pink[400]),
                ),
              ),
              SizedBox(height: 12.0),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              ),
            ],
          ))),
    );
  }
}
