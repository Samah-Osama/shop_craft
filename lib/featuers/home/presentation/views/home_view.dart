import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shop_craft/core/utils/app_colors.dart';
import 'package:shop_craft/featuers/home/presentation/views/widgets/home_view_body.dart';
import 'package:shop_craft/generated/locale_keys.g.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(LocaleKeys.ourProducts.tr() ,style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),),
        backgroundColor: AppColors.background,
      ),
      body: HomeViewBody(),
    );
  }
}