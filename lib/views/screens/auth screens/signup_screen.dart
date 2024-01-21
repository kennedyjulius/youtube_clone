
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_clone/services/auth_service.dart';
import 'package:youtube_clone/views/utils/utils.dart';

class SignupScreen extends StatelessWidget {
  final AuthService _authService = Get.find<AuthService>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  GlobalKey<FormState> _key = GlobalKey<FormState>();
  SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: _key,
            child: Column(
              children: [
                Text("Welcome"),
                SizedBox(
                  height: 15,
                ),
                MyTextInputField(
                  labelText: "Email",
                  hintText: "Enter Your Email",
                  controller: emailController,
                  obscureText: false,
                  suffixIcon: Icons.clear,
                  onchanged: null,
                  onsuffixIconTap: () {
                    emailController.clear();
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                //password
                MyTextInputField(
                  labelText: "Password",
                  hintText: "Enter Your password",
                  controller: passwordController,
                  obscureText: true,
                  suffixIcon: Icons.visibility,
                  onchanged: null,
                ),
                //confrim password
                SizedBox(
                  height: 15,
                ),
                MyTextInputField(
                  labelText: "Confirm Password",
                  hintText: "Confirm your password",
                  controller: confirmPasswordController,
                  obscureText: true,
                  suffixIcon: Icons.visibility,
                  onchanged: null,
                  //validator: ,
                ),
                SizedBox(
                  height: 15,
                ),

                OutlinedButton(
                    onPressed: () {
                      if (_key.currentState?.validate() ?? false) {
                        _authService.signUp(
                            emailController.text,
                            passwordController.text,
                            confirmPasswordController.text);
                      }
                    },
                    child: Text("SignUp")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
