import 'package:flutter/material.dart';

// login components
import './input_field.dart';
import './primary_form_button.dart';
import './secondary_form_button.dart';

class Login extends StatefulWidget {
  const Login({Key? key, required this.switchToCreateAccount}) : super(key: key);

  final Function switchToCreateAccount;

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  signInFunc() {
    print('sign in');
  }


  @override
  Widget build(BuildContext context) {
    return Form(
      key: const Key('login'),
      child: Column(
        children: [
          // username text field
          const InputField(key: Key('username'), label: 'Username'),
          // password text field
          const InputField(key: Key('password'), label: 'Password'),
          Divider(
            thickness: 2.0,
            color: Colors.orange[600],
            indent: 100.0,
            endIndent: 100.0,
          ),
          PrimaryFormButton(label: 'Sign In', onPressedFunc: signInFunc),
          SecondaryFormButton(
              label: 'create an account', onPressedFunc: widget.switchToCreateAccount),
        ]
            //    adding spacing to each element inside the column
            .map((e) =>
                Padding(padding: const EdgeInsets.only(bottom: 30), child: e))
            .toList(),
      ),
    );
  }
}
