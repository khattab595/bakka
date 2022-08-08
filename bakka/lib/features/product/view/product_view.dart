import 'package:bakka/features/home/data/model/home_model.dart';
import 'package:bakka/features/product/data/model/product_model.dart';
import 'package:bakka/features/product/view/product_details_view.dart';
import 'package:bakka/shared/core/assets_manager.dart';
import 'package:bakka/shared/core/color_manger.dart';
import 'package:bakka/shared/core/strings_manager.dart';
import 'package:bakka/shared/core/style_manger.dart';
import 'package:bakka/shared/core/valuse_manger.dart';
import 'package:bakka/shared/core/widget/app_bar.dart';
import 'package:bakka/shared/core/widget/toast_app.dart';
import 'package:bakka/shared/logic/cubit/home/home_cubit.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class ProductView extends StatelessWidget {
  const ProductView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is SuccessFavoritesState) {
          if (!state.model.status) {
            showToast(message: state.model.message, state: ToastStates.ERROR);
          } else {
            showToast(message: state.model.message, state: ToastStates.SUCCESS);
          }
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: myAppBar(),
          body: ConditionalBuilder(
            condition: HomeCubit.get(context).homeModel != null,
            builder: (context) =>
                productsBuilder(HomeCubit.get(context).homeModel, context),
            fallback: (context) =>
                Center(child: Image.asset(ImageAssets.loading)),
          ),
        );
      },
    );
  }

  Widget productsBuilder(HomeModel? model, context) => SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            StaggeredGrid.count(
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              crossAxisCount: 2,
              children: List.generate(
                model!.data.products.length,
                (index) =>
                    buildGridProduct(model.data.products[index], context),
              ),
            ),
          ],
        ),
      );

  Widget buildGridProduct(ProductModel model, context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: ColorManger.darkPrimary,
              ),
            ),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(AppSize.s4),
                  alignment: Alignment.centerRight,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      model.discount == 0
                          ? Container()
                          : Text(
                              "${model.oldPrice}",
                              style:
                                  getMediumStyle(color: Colors.black).copyWith(
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                      Text(
                        "${model.price}",
                        style: getMediumStyle(color: Colors.black),
                      ),
                      IconButton(
                          onPressed: () {
                            HomeCubit.get(context).changeFavorites(model.id);
                          },
                          icon: HomeCubit.get(context).favorites[model.id]!
                              ? Icon(
                                  Icons.favorite,
                                  color: ColorManger.error,
                                )
                              : Icon(
                                  Icons.favorite_border,
                                  color: ColorManger.error,
                                )),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Get.to(()=> ProductDetails(model: model));
                  },
                  child: Image(
                    image: NetworkImage(model.image),
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: ColorManger.darkGrey,
                    border: Border.all(
                      color: ColorManger.darkPrimary,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      children: [
                        Text(
                          model.name,
                          style: getSemiBoldStyle(
                                  color: Colors.black, fontSize: AppSize.s14)
                              .copyWith(overflow: TextOverflow.ellipsis),
                        ),
                        model.discount == 0
                            ? Container()
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.discount_outlined,
                                    size: AppSize.s20,
                                    color: ColorManger.error,
                                  ),
                                  const SizedBox(
                                    width: AppSize.s30,
                                  ),
                                  Text("% ${model.discount}"),
                                  const SizedBox(
                                    width: AppSize.s8,
                                  ),
                                  const Text(AppStrings.discount)
                                ],
                              ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
