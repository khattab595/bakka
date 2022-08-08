import 'package:bakka/features/category/logic/category_cubit.dart';
import 'package:bakka/features/favorite/data/model/change_favorites_model.dart';
import 'package:bakka/features/favorite/data/model/get_favorite_model.dart';
import 'package:bakka/shared/core/assets_manager.dart';
import 'package:bakka/shared/core/color_manger.dart';
import 'package:bakka/shared/core/strings_manager.dart';
import 'package:bakka/shared/core/style_manger.dart';
import 'package:bakka/shared/core/widget/app_bar.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/core/valuse_manger.dart';
import '../../../shared/core/widget/toast_app.dart';
import '../../../shared/logic/cubit/home/home_cubit.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({Key? key}) : super(key: key);

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
        final favorite = HomeCubit.get(context).favoriteModel;
        return Scaffold(
          appBar: myAppBar(),
          body: favorite == null
              ? const Center(
                child: Text("Favorite is Empty"),
              )
              : ConditionalBuilder(
                  condition: state is! LoadingGetFavoritesState,
                  builder: (context) => ListView.separated(
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) => buildListFavorite(
                          favorite.data.data[index], context),
                      separatorBuilder: (context, index) => const SizedBox(
                            height: 20,
                          ),
                      itemCount: favorite.data.data.length),
                  fallback: (context) =>
                      Center(child: Image.asset(ImageAssets.loading)),
                ),
        );
      },
    );
  }

  Widget buildListFavorite(FavoriteData model, context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: SizedBox(
        height: 130,
        child: Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.bottomCenter,
                height: 120,
                width: 150,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(model.product.image),
                    fit: BoxFit.cover,
                  ),
                ),
                child: model.product.discount == 0
                    ? Container()
                    : Container(
                        color: ColorManger.white.withOpacity(.6),
                        height: 40,
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(Icons.discount_outlined),
                            const SizedBox(
                              width: AppSize.s8,
                            ),
                            Text("% ${model.product.discount}"),
                            const SizedBox(
                              width: AppSize.s8,
                            ),
                            const Text(AppStrings.discount)
                          ],
                        ),
                      ),
              ),
              const SizedBox(
                width: 3,
              ),
              const Spacer(),
              Container(
                width: 190,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      model.product.name,
                      maxLines: 3,
                      style: getSemiBoldStyle(
                              color: Colors.black, fontSize: AppSize.s14)
                          .copyWith(
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Row(
                      children: [
                        model.product.discount == 0
                            ? Container()
                            : Text(
                                "eg ${model.product.oldPrice}",
                                style: getMediumStyle(color: Colors.black)
                                    .copyWith(
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "eg ${model.product.price}",
                          style: getMediumStyle(color: Colors.black),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        IconButton(
                          onPressed: () {
                            HomeCubit.get(context)
                                .changeFavorites(model.product.id);
                          },
                          icon: HomeCubit.get(context)
                                  .favorites[model.product.id]!
                              ? Icon(
                                  Icons.favorite,
                                  color: ColorManger.error,
                                )
                              : Icon(
                                  Icons.favorite_border,
                                  color: ColorManger.error,
                                ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
