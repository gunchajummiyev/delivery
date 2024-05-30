import 'package:delivery/components/my_button.dart';
import 'package:delivery/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:delivery/components/my_textfield.dart';


class LoginPage extends StatefulWidget {
  final void Function()? onTap;

  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final  emailController = TextEditingController();
  final  passwordController = TextEditingController();

  //login method
  void login() async {
    //get instance of auth service
    final _authService = AuthService();

    //try sign in
    try {
      await _authService.signInWithEmailPassword(emailController.text, passwordController.text,);
    }
   //display any errors
    catch(e) {
      showDialog(context: context,
        builder: (context) => AlertDialog(
          title:Text(e.toString()),
        ),
      );
    }
  }

  //forgot password
  void forgotPw() {
    showDialog(context: context,
        builder: (context) => AlertDialog(
          backgroundColor: Theme.of(context).colorScheme.background,
          title: const Text("User tapped forgot password"),
        ),
    );
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
              
              Icon(Icons.shopping_cart_outlined,
              size: 100,
              color: Theme.of(context).colorScheme.inversePrimary,
              ),
              const SizedBox(height: 25),

              Text(
                "Food Delivery App",
                style: TextStyle(fontSize: 16,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
              ),
              const SizedBox(height: 25),

              MyTextField(controller: emailController, hintText: "Email", obscureText: false,),

              const SizedBox(height: 25),

              MyTextField(controller: passwordController, hintText: "Password", obscureText: true,
              ),
              const SizedBox(height: 10),

              MyButton(text: "Sign In", onTap: login,
              ),
              const SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                      "Not a member?",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: Text("Register now",
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
