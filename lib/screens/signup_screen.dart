import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  static final id = 'signup_screen';
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formkey = GlobalKey<FormState>();
  String _name;
  String _email;
  String _password;

  _signin() {
    if (_formkey.currentState.validate()) {
      _formkey.currentState.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Create Account',
                style: TextStyle(fontSize: 50.0, fontFamily: 'Dancing'),
              ),
              Form(
                key: _formkey,
                child: Column(
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                      child: TextFormField(
                        decoration: InputDecoration(labelText: 'Name'),
                        validator: (input) =>
                            input.trim().isEmpty ? 'Enter Valid Name' : null,
                        onSaved: (input) {
                          _name = input;
                        },
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                      child: TextFormField(
                        decoration: InputDecoration(labelText: 'Email'),
                        validator: (input) =>
                            !input.contains('@') ? 'Enter valid email' : null,
                        onSaved: (input) {
                          _email = input;
                        },
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                      child: TextFormField(
                        decoration: InputDecoration(labelText: 'Password'),
                        validator: (input) => input.length < 6
                            ? 'Pass needs to be > 6 characters'
                            : null,
                        onSaved: (input) {
                          _password = input;
                        },
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      height: 60,
                      width: 250,
                      child: FlatButton(
                          color: Colors.blue,
                          onPressed: () {
                            _signin();
                            print(_name);
                            print(_email);
                            print(_password);
                          },
                          child: Text(
                            'Sign Up',
                            style:
                                TextStyle(color: Colors.white, fontSize: 18.0),
                          )),
                    ),
                    SizedBox(height: 20),
                    Container(
                      height: 60,
                      width: 250,
                      child: FlatButton(
                          color: Colors.blue,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Back to Login',
                            style:
                                TextStyle(color: Colors.white, fontSize: 18.0),
                          )),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
