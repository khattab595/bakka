import 'package:bakka/shared/core/constant_manager.dart';
import 'package:bakka/shared/core/strings_manager.dart';
import 'package:bakka/shared/core/style_manger.dart';
import 'package:bakka/shared/core/valuse_manger.dart';
import '../../../../shared/core/color_manger.dart';
import 'package:bakka/shared/data/service/cache_helper.dart';
import 'package:bakka/features/onboarding/view/widget/onboarding_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../auth/view/login/login_view.dart';
import '../logic/onbarding_cubit.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OnbardingCubit, OnbardingState>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = OnbardingCubit.get(context).boarding;
        var onBoardingCubit = OnbardingCubit.get(context);
        return Scaffold(
            body: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: onBoardingCubit.boardController,
                onPageChanged: (int index) {
                  if (index == onBoardingCubit.boarding.length - 1) {
                    setState(() {
                      onBoardingCubit.isLast = true;
                    });
                  } else {
                    setState(() {
                      onBoardingCubit.isLast = false;
                    });
                  }
                },
                itemBuilder: (context, index) {
                  return BuildOnBoardingItem(
                    model: list[index],
                  );
                },
                itemCount: list.length,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(AppPadding.p16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      onBoardingCubit.boardController.previousPage(
                        duration: Duration(
                            microseconds: ConstantManager.durationMicroseconds),
                        curve: Curves.bounceInOut,
                      );
                    },
                    child: const Icon(Icons.arrow_back_ios_new_sharp),
                  ),
                  SmoothPageIndicator(
                    controller: onBoardingCubit.boardController,
                    count: list.length,
                    effect: ExpandingDotsEffect(
                      dotColor: ColorManger.grey1,
                      dotHeight: AppSize.s12,
                      expansionFactor: AppSize.s4,
                      dotWidth: AppSize.s12,
                      spacing: AppSize.s4,
                    ),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      if (onBoardingCubit.isLast) {
                        submit();
                      } else {
                        onBoardingCubit.boardController.nextPage(
                          duration: Duration(
                              microseconds:
                                  ConstantManager.durationMicroseconds),
                          curve: Curves.bounceInOut,
                        );
                      }
                    },
                    child: const Icon(Icons.arrow_forward_ios),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: AppSize.s20,
            ),
            GestureDetector(
              onTap: () {
                submit();
              },
              child: Text(
                AppStrings.skip,
                style: getBoldStyle(
                    color: ColorManger.darkPrimary, fontSize: AppSize.s20),
              ),
            ),
            const SizedBox(
              height: AppSize.s22,
            )
          ],
        ));
      },
    );
  }

  void submit() {
    CacheHelper.saveData(key: "onBoarding", value: true).then((value) {
      if (value) {
        Get.off(() => LoginView());
      }
    });
  }
}
