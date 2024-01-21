import 'package:flutter/material.dart';

class MyTextInputField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final TextEditingController controller;
  final bool obscureText;
  final Function()? onchanged;
  final IconData suffixIcon;
  final Function()? onsuffixIconTap;
  final String? Function(String?)? validator;
   MyTextInputField({super.key, 
   required this.labelText, 
   required this.hintText, 
   required this.controller, 
   required this.obscureText, 
   this.onchanged, 
   required this.suffixIcon, 
   this.onsuffixIconTap, 
   this.validator
   });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        obscureText: obscureText,
        validator: validator,
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          labelText: labelText,
          suffixIcon: GestureDetector(onTap: onsuffixIconTap, child: Icon(suffixIcon),),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          )
        ),
        

      ),
    );
  }
}
