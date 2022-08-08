import 'package:bakka/features/product/data/model/product_model.dart';
import 'package:bakka/shared/core/color_manger.dart';
import 'package:bakka/shared/core/style_manger.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/core/strings_manager.dart';
import '../../../shared/core/valuse_manger.dart';
import '../../../shared/core/widget/app_bar.dart';
import '../../../shared/core/widget/toast_app.dart';
import '../../../shared/logic/cubit/home/home_cubit.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({Key? key, required this.model}) : super(key: key);
  final ProductModel model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSize.s8),
          child: Column(
            children: [
              const SizedBox(
                height: AppSize.s20,
              ),
              CarouselSlider(
                items: model.images
                    .map(
                      (e) => Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: AppPadding.p8),
                        child: Container(
                          alignment: Alignment.bottomCenter,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(AppPadding.p20),
                              image: DecorationImage(
                                  image: NetworkImage(
                                    e,
                                  ),
                                  fit: BoxFit.contain)),
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
                  autoPlayInterval: const Duration(seconds: 6),
                  autoPlayAnimationDuration: const Duration(seconds: 3),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  scrollDirection: Axis.horizontal,
                ),
              ),
              const SizedBox(
                height: AppSize.s20,
              ),
              Text(
                model.name,
                style: getBoldStyle(
                  color: ColorManger.darkPrimary,
                  fontSize: AppSize.s20,
                ),
              ),
              const SizedBox(
                height: AppSize.s20,
              ),
              Container(
                alignment: Alignment.centerRight,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    model.discount == 0
                        ? Container()
                        : Text(
                            "${model.oldPrice}",
                            style: getMediumStyle(
                                    color: Colors.black, fontSize: AppSize.s22)
                                .copyWith(
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                    const SizedBox(
                      width: AppSize.s30,
                    ),
                    Text(
                      "${model.price}",
                      style: getMediumStyle(
                          color: Colors.black, fontSize: AppSize.s22),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: AppSize.s20,
              ),
              model.discount == 0
                  ? Container()
                  : Row(
                      children: [
                        Icon(
                          Icons.discount_outlined,
                          size: AppSize.s40,
                          color: ColorManger.error,
                        ),
                        const SizedBox(
                          width: AppSize.s30,
                        ),
                        Text(
                          "% ${model.discount}",
                          style: getMediumStyle(
                              color: Colors.black, fontSize: AppSize.s22),
                        ),
                        const SizedBox(
                          width: AppSize.s20,
                        ),
                        Text(
                          AppStrings.discount,
                          style: getMediumStyle(
                              color: Colors.black, fontSize: AppSize.s22),
                        )
                      ],
                    ),
              const SizedBox(
                height: AppSize.s20,
              ),
              Text(
                model.description,
                style:
                    getMediumStyle(color: Colors.black, fontSize: AppSize.s16),
              ),
              const SizedBox(
                height: AppSize.s20,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BlocConsumer<HomeCubit, HomeState>(
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
          return GestureDetector(
            onTap: () {
             HomeCubit.get(context).addToCart(model.id);
            },
            child: Container(
              color: ColorManger.orange,
              alignment: Alignment.center,
              height: 40,
              width: double.infinity,
              child: Text(
                "add to cart",
                style: getBoldStyle(
                  color: ColorManger.white,
                  fontSize: AppSize.s22,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
