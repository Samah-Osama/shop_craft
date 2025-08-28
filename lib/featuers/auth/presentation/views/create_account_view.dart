import 'package:flutter/material.dart';
import 'package:shop_craft/core/utils/app_colors.dart';
import 'package:shop_craft/featuers/auth/presentation/views/widgets/create_account_view_body.dart';

class CreateAccountView extends StatelessWidget {
  const CreateAccountView({super.key});
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
      body: CreateAccountViewBody(),
    );
  }
}
