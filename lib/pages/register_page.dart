import 'package:chat_app/auth/auth_service.dart';
import 'package:flutter/material.dart';

import '../components/buttons.dart';
import '../components/textfield.dart';

class RegisterPage extends StatelessWidget {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final TextEditingController _confirmPwController = TextEditingController();

  final void Function()? onTap;

  RegisterPage({
    super.key,
    required this.onTap,
  });

  void register (BuildContext context) {
    final _auth = AuthService();

    if (_pwController.text == _confirmPwController.text) {
      try {
        _auth.signUpWithEmailPassword(
          _emailController.text,
          _pwController.text,
        );
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(e.toString()),
          ),
        );
      }
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Passwords don't match!"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              // logo
              Icon(
                Icons.message,
                size: 60,
                color: Theme.of(context).colorScheme.primary,
              ),

              SizedBox(height: 40,),

              // welcome back message
              Text(
                "Let's create an account",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 16,
                ),
              ),

              SizedBox(height: 50,),

              // email textfield
              MyTextField(
                hintText: "Email",
                obsecureText: false,
                controller: _emailController,
              ),

              SizedBox(height: 25,),

              // password textfield
              MyTextField(
                hintText: "Password",
                obsecureText: true,
                controller: _pwController,
              ),

              SizedBox(height: 25,),

              // confirm password textfield
              MyTextField(
                hintText: "Confirm Password",
                obsecureText: true,
                controller: _confirmPwController,
              ),

              SizedBox(height: 25,),

              // login button
              MyButton(
                text: "Register",
                onTap: () => register(context),
              ),

              SizedBox(height: 25,),

              // register now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account? ",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary),
                  ),
                  GestureDetector(
                    onTap: onTap,
                    child: Text(
                    "Login Now",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary),
                    ),
                  ),
                ],
              )
            ],
          ),
        )
    );
  }
}
