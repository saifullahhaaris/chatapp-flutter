import 'package:chat_app/components/buttons.dart';
import 'package:chat_app/components/textfield.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();

  LoginPage({super.key});

  void login(){

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

            SizedBox(height: 50,),

            // welcome back message
            Text(
              "Welcome back!",
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

            // email textfield
            MyTextField(
              hintText: "Password",
              obsecureText: true,
              controller: _pwController,
            ),

            SizedBox(height: 50,),

            // login button
            MyButton(
              text: "Login",
              onTap: login,
            ),

            // register now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    "Not a member? ",
                  style: TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                Text(
                  "Register Now",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary),
                ),
              ],
            )
          ],
        ),
      )
    );
  }
}
