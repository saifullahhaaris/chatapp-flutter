import 'package:chat_app/auth/auth_service.dart';
import 'package:chat_app/components/buttons.dart';
import 'package:chat_app/components/textfield.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();

  final void Function()? onTap;

  LoginPage({
    super.key,
    required this.onTap,
  });

  void login(BuildContext context) async {
    // Auth service
    final authService = AuthService();
    
    // try login
    try{
      await authService.signInWithEmailPassword(
          _emailController.text, 
          _pwController.text
      );
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
        title: Text(e.toString()),
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

            // password textfield
            MyTextField(
              hintText: "Password",
              obsecureText: true,
              controller: _pwController,
            ),

            SizedBox(height: 50,),

            // login button
            MyButton(
              text: "Login",
              onTap: () => login(context),
            ),

            SizedBox(height: 25,),

            // register now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Not a member? ",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.primary),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    "Register Now",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary),
                  ),
                )
              ],
            )
          ],
        ),
      )
    );
  }
}
