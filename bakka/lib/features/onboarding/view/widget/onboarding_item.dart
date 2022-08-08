import 'package:bakka/features/onboarding/data/model/onboarding_model.dart';
import 'package:bakka/shared/core/style_manger.dart';
import 'package:bakka/shared/core/valuse_manger.dart';
import '../../../../shared/core/color_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class BuildOnBoardingItem extends StatelessWidget {
  const BuildOnBoardingItem({Key? key, required this.model, }) : super(key: key);
  final OnBoardingModel model;


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Container(
          decoration:   BoxDecoration(
            color: ColorManger.lightGrey,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(AppSize.s40),
              bottomRight: Radius.circular(AppSize.s40),
            )
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: AppPadding.p8,
            vertical: AppPadding.p20,
          ),
          height: AppSize.height / 1.8,
          child: SvgPicture.asset(
        model.image,
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(AppPadding.p16),
          child: Text(
            model. title,
            style: getBoldStyle(
              color: ColorManger.darkPrimary,
              fontSize: AppSize.s18,
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(AppPadding.p16),
          child: Text(
            model.body,
            style: getMediumStyle(
              color: ColorManger.grey1,
              fontSize: AppSize.s14,
            ),
          ),
        ),
      ],
    );
  }
}
