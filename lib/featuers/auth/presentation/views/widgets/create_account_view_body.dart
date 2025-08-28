import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shop_craft/core/utils/custom_text_form_filed.dart';
import 'package:shop_craft/core/utils/validator.dart';
import 'package:shop_craft/generated/locale_keys.g.dart';

class CreateAccountViewBody extends StatefulWidget {
  const CreateAccountViewBody({super.key});

  @override
  _CreateAccountViewBodyState createState() => _CreateAccountViewBodyState();
}

class _CreateAccountViewBodyState extends State<CreateAccountViewBody> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                       LocaleKeys.createAccount.tr(),
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple[900],
                        ),
                      ),
                      const SizedBox(height: 16),

                      Text(
                        "Join ShopCraft today",
                        style: TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 32),
                      Align(
                        alignment: Alignment.centerLeft,

                        child: Text(
                          LocaleKeys.fullName.tr(),
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      CustomTextFormFieled(
                        textEditingController: _fullNameController,
                        labelText:LocaleKeys.fullName.tr(),
                        hintText: LocaleKeys.enterYourFullName.tr(),
                        shouldObscureText: false,
                        validator: (val) {
                          return Validator.validateName(val);
                        },
                      ),
                      const SizedBox(height: 16),

                      Align(
                        alignment: Alignment.centerLeft,

                        child: Text(
                          LocaleKeys.email.tr(),
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      CustomTextFormFieled(
                        textEditingController: _emailController,
                        labelText: LocaleKeys.email.tr(),
                        hintText: LocaleKeys.enterYourEmail.tr(),
                        shouldObscureText: false,
                        validator: (val) {
                          return Validator.validateEmail(val);
                        },
                      ),

                      const SizedBox(height: 16),
                      Align(
                        alignment: Alignment.centerLeft,

                        child: Text(
                          LocaleKeys.password.tr(),
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      CustomTextFormFieled(
                        textEditingController: _passwordController,
                        labelText: LocaleKeys.password.tr(),
                        hintText: LocaleKeys.enterYourPassword.tr(),
                        shouldObscureText: true,
                        validator: (val) {
                          return Validator.validatePassword(val);
                        },
                      ),
                      const SizedBox(height: 16),
                      Align(
                        alignment: Alignment.centerLeft,

                        child: Text(
                          LocaleKeys.confirmPassword.tr(),
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      CustomTextFormFieled(
                        textEditingController: _confirmPasswordController,
                        labelText: LocaleKeys.confirmPassword.tr(),
                        hintText: LocaleKeys.confirmPassword.tr(),
                        shouldObscureText: true,
                        validator: (val) {
                          return Validator.validateConfirmPassword(
                            val,
                            _passwordController.text,
                          );
                        },
                      ),
                      const SizedBox(height: 32),

                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {}
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple[900],
                          padding: const EdgeInsets.symmetric(
                            horizontal: 48,
                            vertical: 16,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          LocaleKeys.createAccount.tr(),
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
