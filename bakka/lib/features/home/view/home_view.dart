import 'package:bakka/features/category/data/model/category_model.dart';
import 'package:bakka/features/home/data/model/home_model.dart';
import 'package:bakka/features/product/view/product_view.dart';
import 'package:bakka/shared/core/assets_manager.dart';
import 'package:bakka/shared/core/strings_manager.dart';
import 'package:bakka/shared/core/style_manger.dart';
import 'package:bakka/shared/core/valuse_manger.dart';
import 'package:bakka/shared/core/widget/app_bar.dart';
import 'package:bakka/shared/data/service/cache_helper.dart';
import 'package:bakka/shared/logic/cubit/home/home_cubit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../shared/core/color_manger.dart';
import '../../category/logic/category_cubit.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoryCubit, CategoryState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: myAppBar(),
          body: ConditionalBuilder(
            condition: CategoryCubit.get(context).categoriesModel != null,
            builder: (context) =>
                productsBuilder(CategoryCubit.get(context).categoriesModel),
            fallback: (context) =>
                Center(child: Image.asset(ImageAssets.loading)),
          ),
        );
      },
    );
  }

  Widget productsBuilder(CategoriesModel? model) => SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: AppSize.height * .55,
              width: AppSize.width,
              alignment: Alignment.centerLeft,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        ImageAssets.home,
                      ),
                      fit: BoxFit.cover)),
              child: Padding(
                padding: const EdgeInsets.all(AppPadding.p22),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        AppStrings.saleOfThe,
                        style: getSemiBoldStyle(
                            color: ColorManger.darkPrimary,
                            fontSize: AppSize.s40),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.to(() => const ProductView());
                            },
                            child: CircleAvatar(
                              backgroundColor: ColorManger.orange,
                              child: const Icon(Icons.arrow_forward_ios_sharp),
                            ),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          Text(
                            AppStrings.shopNow,
                            style: getSemiBoldStyle(
                                color: ColorManger.darkPrimary,
                                fontSize: AppSize.s22),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            CarouselSlider(
              items: model?.data.data
                  .map(
                    (e) => Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: AppPadding.p8),
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(AppPadding.p20),
                            image: DecorationImage(
                                image: NetworkImage(
                                  e.image,
                                ),
                                fit: BoxFit.cover)),
                        child: Container(
                          height: 50,
                          color: ColorManger.darkPrimary.withOpacity(.4),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: AppPadding.p12),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Get.to(() => const ProductView());
                                  },
                                  child: CircleAvatar(
                                    backgroundColor: ColorManger.orange,
                                    child: const Icon(
                                        Icons.arrow_forward_ios_sharp),
                                  ),
                                ),
                                const SizedBox(
                                  width: 30,
                                ),
                                Text(
                                  e.name,
                                  style: getSemiBoldStyle(
                                      color: ColorManger.white,
                                      fontSize: AppSize.s22),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
              options: CarouselOptions(
                height: AppSize.height * .25,
                autoPlay: true,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                viewportFraction: .9,
                autoPlayInterval: const Duration(seconds: 10),
                autoPlayAnimationDuration: const Duration(seconds: 3),
                autoPlayCurve: Curves.fastOutSlowIn,
                scrollDirection: Axis.horizontal,
              ),
            ),
          ],
        ),
      );
}

