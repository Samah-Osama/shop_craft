import 'dart:convert';
import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shop_craft/featuers/home/data/products_model.dart';
import 'package:shop_craft/featuers/home/presentation/views/widgets/featured_product_item.dart';
import 'package:shop_craft/featuers/home/presentation/views/widgets/hot_offers_widget.dart';
import 'package:shop_craft/featuers/home/presentation/views/widgets/products_card.dart';
import 'package:shop_craft/generated/locale_keys.g.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  List<Products> products = [];
  bool isLoading = false;
  @override
  void initState() {
    loadProducts();
    super.initState();
  }

  Future<void> loadProducts() async {
    try {
      final String jsonString = await rootBundle.loadString(
        'assets/products.json',
      );
      final Map<String, dynamic> jsonData = json.decode(jsonString);
      final List<dynamic> productsJson = jsonData['products'];

      setState(() {
        products = productsJson.map((json) => Products.fromJson(json)).toList();
        isLoading = false;
      });
    } catch (e) {
      log('Error loading products: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            Text(
              LocaleKeys.featuredProducts.tr(),
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 200,
              child: PageView(
                children: [
                  FeaturedProductItem(
                    imageUrl: "assets/images/shop_craft/banner_1.jpg",
                    title: LocaleKeys.phoneOffers.tr(),
                  ),
                  FeaturedProductItem(
                    imageUrl: "assets/images/shop_craft/banner_2.jpg",
                    title: LocaleKeys.premiumHeadPhonesCollection.tr(),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            Text(
              LocaleKeys.allProducts.tr(),
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.7,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                return ProductCard(product: products[index]);
              },
            ),
            const SizedBox(height: 24),

            Text(
              LocaleKeys.hotOffers.tr(),
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
              child: ListView(
                children: [
                  HotOfferItem(
                    title: "Free Shipping Weekend",

                    description:
                        "Get amazing discounts on our premium products. Limited time only!",
                    buttonText: 'Free Shipping',
                  ),
                  HotOfferItem(
                    title: "50% Off Electronics",

                    description: "Limited time offer on all tech gadgets",
                    buttonText: '50% OFF',
                  ),
                  HotOfferItem(
                    title: "Buy2Get1Free",

                    description: "On selected accessories and peripherals",
                    buttonText: 'B2G1',
                  ),
                  HotOfferItem(
                    title: "Special Offer",

                    description:
                        "Get amazing discounts on our premium products. Limited time only!",
                    buttonText: '50% OFF',
                  ),
                  HotOfferItem(
                    title: "Buy1Get1Free",

                    description: "On selected accessories and peripherals",
                    buttonText: 'B1G1',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
