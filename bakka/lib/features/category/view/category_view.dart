import 'package:bakka/features/category/data/model/category_model.dart';
import 'package:bakka/features/category/logic/category_cubit.dart';
import 'package:bakka/shared/core/assets_manager.dart';
import 'package:bakka/shared/core/style_manger.dart';
import 'package:bakka/shared/core/widget/app_bar.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/core/color_manger.dart';
import '../../../shared/core/valuse_manger.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoryCubit, CategoryState>(
      listener: (context, state) {

      },
      builder: (context, state) {
        final categoryCubit = CategoryCubit.get(context).categoriesModel;
        return Scaffold(
          appBar: myAppBar(),
          body: ConditionalBuilder(
            condition: CategoryCubit.get(context).categoriesModel != null,
            builder: (context) => ListView.separated(
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) => buildCategoryItem(
                      name: categoryCubit!.data.data[index].name,
                      image: categoryCubit.data.data[index].image,
                    ),
                separatorBuilder: (context, index) => const SizedBox(
                      height: 20,
                    ),
                itemCount: categoryCubit!.data.data.length),
            fallback: (context) =>
                Center(child: Image.asset(ImageAssets.loading)),
          ),
        );
      },
    );
  }

  Widget buildCategoryItem({required String name, required String image}) =>
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p8),
        child: GestureDetector(
          onTap: (){

          },
          child: Container(
            height: AppSize.height * .2,
            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppPadding.p20),
                image: DecorationImage(
                    image: NetworkImage(
                      image,
                    ),
                    fit: BoxFit.cover)),
            child: Container(
              height: 50,
              color: ColorManger.darkPrimary.withOpacity(.4),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppPadding.p12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: CircleAvatar(
                        backgroundColor: ColorManger.orange,
                        child: const Icon(Icons.arrow_forward_ios_sharp),
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Text(
                      name,
                      style: getSemiBoldStyle(
                          color: ColorManger.darkPrimary, fontSize: AppSize.s30),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}
