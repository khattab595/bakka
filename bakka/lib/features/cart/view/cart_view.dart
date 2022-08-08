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
import '../data/model/get_cart_model.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is SuccessCartState) {
          if (!state.model.status) {
            showToast(message: state.model.message, state: ToastStates.ERROR);
          } else {
            showToast(message: state.model.message, state: ToastStates.SUCCESS);
          }
        }
      },
      builder: (context, state) {
        final cart = HomeCubit.get(context).cartsModel;

        return Scaffold(
          appBar: myAppBar(),
          body: cart == null
              ? const Center(
                  child: Text("Cart is Empty"),
                )
              : ConditionalBuilder(

                  condition: state is! LoadingGetCartState,
                  builder: (context) => ListView.separated(
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) => buildListCart(
                            cart.data.cartItems[index],
                            context,
                            () {
                              HomeCubit.get(context).addMore(index);
                            },
                            () {
                              HomeCubit.get(context).removeMore(index);
                            },
                          ),
                      separatorBuilder: (context, index) => const SizedBox(
                            height: 20,
                          ),
                      itemCount: cart.data.cartItems.length),
                  fallback: (context) =>
                      Center(child: Image.asset(ImageAssets.loading)),
                ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.only(top: AppPadding.p22),
            child: Container(

              alignment: Alignment.center,
              height: 70,
              color: ColorManger.grey,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 200,
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        Text(
                          "Total",
                          style: getBoldStyle(
                            color: ColorManger.white,
                            fontSize: AppSize.s22,
                          ),
                        ),
                        Text(
                          "${HomeCubit.get(context).cartsModel?.data.total}",
                          style: getBoldStyle(
                            color: ColorManger.white,
                            fontSize: AppSize.s22,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      color: ColorManger.orange,
                      alignment: Alignment.center,
                      height: 70,
                      width: 200,
                      child: Text(
                        "Ceek Out",
                        style: getBoldStyle(
                          color: ColorManger.white,
                          fontSize: AppSize.s22,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildListCart(
    CartItem model,
    context,
    Function()? add,
    Function()? remove,
  ) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: SizedBox(
        height: 150,
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
                            const Icon(Icons.discount_outlined),
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
              SizedBox(
                width: 190,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      model.product.name,
                      maxLines: 2,
                      style: getSemiBoldStyle(
                              color: Colors.black, fontSize: AppSize.s14)
                          .copyWith(
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: add,
                          icon: Icon(
                            Icons.add_circle,
                            color: ColorManger.darkPrimary,
                            size: AppSize.s30,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "${model.quantity}",
                          style: getBoldStyle(
                            color: ColorManger.darkPrimary,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        IconButton(
                          onPressed: remove,
                          icon: Icon(
                            Icons.remove_circle,
                            color: ColorManger.darkPrimary,
                            size: AppSize.s30,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "eg ${model.product.price * model.quantity}",
                          style: getMediumStyle(color: Colors.black),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        IconButton(
                          onPressed: () {
                            HomeCubit.get(context).addToCart(model.product.id);
                          },
                          icon: Icon(
                            Icons.delete,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
