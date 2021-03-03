import 'package:flutter/material.dart';
import 'package:marcusng_fb_signin_login/screens/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  static final id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formkey = GlobalKey<FormState>();
  String _email;
  String _password;

  _submit() {
    if (_formkey.currentState.validate()) {
      _formkey.currentState.save();
      print(_email);
      print(_password);
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
                'Log in',
                style: TextStyle(
                  fontSize: 50,
                  fontFamily: 'Dancing',
                ),
              ),
              Form(
                key: _formkey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                      child: TextFormField(
                        decoration: InputDecoration(labelText: 'Email'),
                        validator: (input) => !input.contains('@')
                            ? 'Please enter a valid email'
                            : null,
                        onSaved: (input) {
                          _email = input;
                        },
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                      child: TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(labelText: 'Password'),
                        validator: (input) => input.length < 6
                            ? 'Please enter password > 6 characters'
                            : null,
                        onSaved: (input) {
                          _password = input;
                        },
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: 250,
                      height: 50,
                      child: FlatButton(
                        onPressed: _submit,
                        color: Colors.blue,
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'Log In',
                          style: TextStyle(color: Colors.white, fontSize: 18.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: 250,
                      height: 50,
                      child: FlatButton(
                        color: Colors.blue,
                        child: Text(
                          'Go to Signup',
                          style: TextStyle(color: Colors.white, fontSize: 18.0),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, SignupScreen.id);
                        },
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
