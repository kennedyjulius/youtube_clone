
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_clone/views/screens/other%20screens/home_screen.dart';

class AuthService extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  RxBool isLoading = false.obs;
  Rx<User?> user = Rx<User?>(null);

  @override
  void onInit() {
    super.onInit();
    user.bindStream(_auth.authStateChanges());
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter your email";
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter your password";
    }
    return null;
  }

  String? validateConfrimPassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Please your email do not match";
    }
    return null;
  }

  Future<void> signUp(
      String email, String password, String ConfirmPassowrd) async {
    String? emailError = validateEmail(email);
    String? passwordError = validateEmail(password);
    String? ConfirmPasswordError = validateEmail(ConfirmPassowrd);
    if (emailError == null && passwordError == null) {
      if (passwordController.text == confirmPasswordController.text) {
        try {
          Get.dialog(Center(
            child: SizedBox(
              height: 40,
              width: 40,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              ),
            ),
          )
          );
          UserCredential result = await _auth.createUserWithEmailAndPassword(
              email: email, password: password);
          user.value = result.user;
          Get.back();

          Get.to(HomeScreen());
        } catch (e) {
          Get.back();
          Get.snackbar("Alert", "Invalid Email or password");
        }
      } else
        Get.snackbar("Alert", "Passowords dont match");
    }
    Get.snackbar("Alert", "Invalid email or passowrd");
  }

  Future<void> Login(
    String email, String password,) async {
    String? emailError = validateEmail(email);
    String? passwordError = validateEmail(password);
   // String? ConfirmPasswordError = validateEmail(ConfirmPassowrd);
    if (emailError == null && passwordError == null) {
      try {
        Get.dialog(Center(
          child: SizedBox(
            height: 40,
            width: 40,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
          ),
        ));
        UserCredential result = await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        user.value = result.user;
        Get.back();

        Get.to(HomeScreen());
      } catch (e) {
        Get.back();
        //Get.snackbar("Alert", "Invalid Email or password");
      }
    } else
      Get.snackbar("Alert", "login successful");
  }

  Future<void> LogOut() async {
    await _auth.signOut();
    user.value = null;
  }
}
