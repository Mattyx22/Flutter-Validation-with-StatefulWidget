import 'package:flutter/material.dart';
import '../mixins/validation_mixin.dart';

class  LoginScreen extends StatefulWidget {
  createState(){
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> with ValidationMixin {
  final formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';

  Widget build(context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            emailField(),
            passwordField(),
            Container(margin: const EdgeInsets.only(bottom: 25)),
            submitButton(),
          ],
        ),
      ),
    );
  }

  Widget emailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        labelText: 'Email Address',
        hintText: 'you@example.com',
      ),
      validator: validateEmail,
      onSaved: (String? value) {
        email = value!;
      }
    );
  }

  Widget passwordField() {
    return TextFormField(
      obscureText: true,
      decoration: const InputDecoration(
        labelText: 'Password',
        hintText: 'Password',
      ),
      validator: validatePassword,
      onSaved: (String? value) {
        password = value!;
      }
    );
  }

  Widget submitButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(primary: Colors.lightBlueAccent[700]),
      child: const Text('Submit'),
      onPressed: (){
        // formKey.currentState?.reset();
        if (formKey.currentState!.validate()) {
          formKey.currentState!.save();
          print('Time to post $email and $password to my API!');
        }
      },
      );
  }
}