import 'package:flutter/material.dart';

//  components
import '../components/authentication_form/login.dart';
import '../components/authentication_form/create_account.dart';

class Authentication extends StatefulWidget {
  const Authentication({Key? key}) : super(key: key);

  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  bool isAlreadyHaveAccount = true;

  switchToCreateAccount() {
    setState(() {
      isAlreadyHaveAccount = false;
    });
  }

  switchToSignIn() {
    setState(() {
      isAlreadyHaveAccount = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(30.0),
          child: ListView(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.25,
                child: const Center(
                    child: Text(
                      "KIMCHI",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 48.0,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 5.0,
                      ),
                    )),
              ),
              SizedBox(
                child: AnimatedSwitcher(
                    switchInCurve: Curves.easeInToLinear,
                    switchOutCurve: Curves.easeInToLinear,
                    duration: const Duration(milliseconds: 600),
                    child: (isAlreadyHaveAccount)
                        ? Login(switchToCreateAccount: switchToCreateAccount)
                        : CreateAccount(switchToSignIn: switchToSignIn)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
