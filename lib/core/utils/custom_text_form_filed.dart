
import 'package:flutter/material.dart';



class CustomTextFormFieled extends StatelessWidget {
  final TextEditingController textEditingController;
  final String labelText;
  final String hintText;
  final bool shouldObscureText;
  final String? Function(String?)? validator;
  final Widget? suffix;
  final bool? readOnly;
  final Function(String)? onChanged;

  const CustomTextFormFieled({
    super.key,
    required this.textEditingController,
    required this.labelText,
    required this.hintText,
    required this.shouldObscureText,
    this.validator,
    this.suffix,
    this.readOnly,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      readOnly: readOnly ?? false,
      validator: validator,
      controller: textEditingController,
      obscureText: shouldObscureText,
      obscuringCharacter: "*",
    
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(16),
        suffix: suffix,

        
       
        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
        labelText: labelText,
       
        hintText: hintText,
        
      ),
    );
  }
}
