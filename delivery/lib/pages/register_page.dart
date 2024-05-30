import 'dart:developer';

import 'package:delivery/components/my_button.dart';
import 'package:delivery/components/my_textfield.dart';
import 'package:delivery/services/auth_service.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;
  const RegisterPage({super.key, required this.onTap,});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //text editing controllers
  final  emailController = TextEditingController();
  final  passwordController = TextEditingController();
  final  confirmPasswordController = TextEditingController();

  //register method
  void register() async {
    //get auth service
    final _authService = AuthService();

    //check if password match -> create user
    if (passwordController.text == confirmPasswordController.text) {
      //try creating user
      try {
        await _authService.signUpWithEmailPassword(emailController.text, passwordController.text,);
      }

      //display any errors
      catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
          title: Text(e.toString()),
        ),
        );
      }
    }
    //if passwords dont match -> show error
    else{
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text("Passwords don't match!"),
        ),
      );
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),

                //logo
                Icon(Icons.shopping_cart_outlined,
                  size: 100,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
                const SizedBox(height: 25),

                Text(
                  "Let's create an account for you ",
                  style: TextStyle(fontSize: 16,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
                //const SizedBox(height: 10),

                //MyTextField(controller: nameController, hintText: "Name Surname", obscureText: false,),

                const SizedBox(height: 10),

                MyTextField(controller: emailController, hintText: "Email", obscureText: false,),

                const SizedBox(height: 10),

                MyTextField(controller: passwordController, hintText: "Password", obscureText: true,),

                const SizedBox(height: 10),

                MyTextField(controller: confirmPasswordController, hintText: "Confirm password", obscureText: true,),

                const SizedBox(height: 10),

                MyButton(text: "Sign Up", onTap: register,
                ),

                const SizedBox(height: 10),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "already have an account?",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text("Login now",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
