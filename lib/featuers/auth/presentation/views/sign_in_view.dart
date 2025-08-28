import 'package:flutter/material.dart';
import 'package:shop_craft/core/utils/app_colors.dart';
import 'package:shop_craft/featuers/auth/presentation/views/widgets/sign_in_view_body.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      backgroundColor: AppColors.background,
      body: SignInViewBody(),
    );
  }
}
