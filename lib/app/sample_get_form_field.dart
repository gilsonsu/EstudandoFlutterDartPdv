import 'package:flutter/material.dart';

class SampleGetFormField extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<SampleGetFormField> {

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextFormField(controller: _usernameController,),
        TextFormField(controller: _passwordController, obscureText: true,),
        RaisedButton(
          onPressed: _performLogin,
          child: Text('Login'),
        )
      ],
    );
  }

  void _performLogin() {
    String username = _usernameController.text;
    String password = _passwordController.text;

    print('login attempt: $username with $password');
  }
}