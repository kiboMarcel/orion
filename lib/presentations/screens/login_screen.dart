import 'package:flutter/material.dart';
import 'package:validators/validators.dart';

import '../widgets/button.dart';
import '../widgets/password_input_field.dart';
import '../widgets/text_input_filed.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  final Map<String, String> _authData = {
    'email': '',
    'password': '',
  };

  void _submit() {
    setState(() {
      _autovalidateMode = AutovalidateMode.always;
    });

    final form = _formKey.currentState;

    if (form == null || !form.validate()) return;

    form.save();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          autovalidateMode: _autovalidateMode,
          child: ListView(
            children: [
              SizedBox(
                height: 100,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.10),
                child: Align(
                  child: Text(
                    'ManTech',
                    style: TextStyle(fontSize: 25),
                  ),
                  alignment: Alignment.topLeft,
                ),
              ),
              SizedBox(
                height: 80,
              ),
              TextInputField(
                labelText: 'Entrez votre Nom',
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) => {
                  _authData['email'] = value,
                },
                validator: (String? value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Veuillez fournir un email.';
                  }
                  if (!isEmail(value.trim())) {
                    return 'Email  incorrect.';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 2.0,
              ),
              PasswordInputField(
                labelText: 'Entrez votre mot de passe',
                onChanged: (value) => {_authData['password'] = value},
                validator: (String? value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Mot de passe requis.';
                  }
                  if (value.trim().length < 6) {
                    return 'Le mot de passe doit contenir au moins 6 caractères.';
                  }
                  return null;
                },
              ),
              Button(
                child: Text('Se Connecter'),
                onPressed: _submit,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
