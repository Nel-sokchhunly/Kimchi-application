import 'package:flutter/material.dart';

// form component
import './input_field.dart';
import './primary_form_button.dart';
import './secondary_form_button.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key, required this.switchToSignIn}) : super(key: key);

  final Function switchToSignIn;

  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  createAccountFunc() {
    print('create account');
  }

  alreadyHaveAccount() {
    print('back to sign in');
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: const Key('create account'),
      child: Column(
        children: [
          //  username
          const InputField(
            key: Key('username'),
            label: 'Username',
          ),
          //  password
          const InputField(
            key: Key('password'),
            label: 'Password',
          ),
          // re-enter password
          const InputField(
            key: Key('re-enter password'),
            label: 'Re-enter password',
          ),
          Divider(
            thickness: 2.0,
            color: Colors.orange[600],
            indent: 100.0,
            endIndent: 100.0,
          ),
          //  primary button
          PrimaryFormButton(
            key: const Key('create account'),
            label: 'Create an account',
            onPressedFunc: createAccountFunc,
          ),
          //  secondary button
          SecondaryFormButton(
            key: const Key("already have account"),
            label: "Already have an account?",
            onPressedFunc: widget.switchToSignIn,
          )
        ]
            //    adding spacing to each element inside the column
            .map((e) =>
                Padding(padding: const EdgeInsets.only(bottom: 30), child: e))
            .toList(),
      ),
    );
  }
}
