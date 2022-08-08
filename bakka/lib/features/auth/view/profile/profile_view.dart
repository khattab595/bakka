import 'package:bakka/features/auth/view/widget/text_form_app.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/core/assets_manager.dart';
import '../../../../shared/core/color_manger.dart';
import '../../../../shared/core/strings_manager.dart';
import '../../../../shared/core/style_manger.dart';
import '../../../../shared/core/widget/app_bar.dart';
import '../../../../shared/logic/cubit/home/home_cubit.dart';


class ProfileView extends StatelessWidget {
  ProfileView({Key? key}) : super(key: key);
  var emailController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is ProfileSuccessState) {
          emailController.text = state.loginModel.data.email;
          nameController.text = state.loginModel.data.name;
          phoneController.text = state.loginModel.data.phone;
        }
      },
      builder: (context, state) {

    //   emailController.text = HomeCubit.get(context).userData!.data.email;
      // nameController.text =  HomeCubit.get(context).userData!.data.name;
     //  phoneController.text =  HomeCubit.get(context).userData!.data.phone;
        return Scaffold(
          appBar: myAppBar(),
          body: ConditionalBuilder(
            condition: HomeCubit.get(context).userData != null,
            builder: (context) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    child: Text(AppStrings.name,
                        style: getMediumStyle(color: ColorManger.darkPrimary)),
                  ),
                  CustomFormField(
                    icon: const Icon(Icons.person),
                    textCtrl: nameController,
                    hint: AppStrings.enterName,
                    obscureText: false,
                    validate: (String? value) {
                      if (value!.isEmpty) {
                        return AppStrings.pleassEnterName;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    child: Text(AppStrings.email,
                        style: getMediumStyle(color: ColorManger.darkPrimary)),
                  ),
                  CustomFormField(
                    icon: const Icon(Icons.email_outlined),
                    textCtrl: emailController,
                    hint: AppStrings.enterEmail,
                    obscureText: false,
                    validate: (String? value) {
                      if (value!.isEmpty) {
                        return AppStrings.pleassEnterEmail;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    child: Text(AppStrings.phone,
                        style: getMediumStyle(color: ColorManger.darkPrimary)),
                  ),
                  CustomFormField(
                    icon: const Icon(Icons.phone),
                    textCtrl: phoneController,
                    hint: AppStrings.enterPhone,
                    obscureText: false,
                    validate: (String? value) {
                      if (value!.isEmpty) {
                        return AppStrings.pleassEnterPhone;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            fallback: (context) =>
                Center(child: Image.asset(ImageAssets.loading)),
          ),
        );
      },
    );
  }
}
