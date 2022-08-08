import 'package:bakka/features/search/view/search_view.dart';
import 'package:bakka/shared/core/assets_manager.dart';
import 'package:bakka/shared/core/widget/my_app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../features/cart/view/cart_view.dart';


myAppBar() {
  return AppBar(
    title: Row(
      children: [
        Image.asset(ImageAssets.logo),
        const SizedBox(
          width: 10,
        ),
        const Text(
          "E_Shop",
        ),
      ],
    ),

    actions: [

      IconButton(
        onPressed: () {
          Get.to(()=>const SearchView());
        },
        icon: const Icon(Icons.search),
      ),
      IconButton(
        onPressed: () {
          Get.to(()=> const CartView());
        },
        icon: const Icon(Icons.shopping_cart_outlined),
      ),
      DrawerWidget(),
    ],
  );
}
