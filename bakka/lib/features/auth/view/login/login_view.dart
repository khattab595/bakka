import 'package:bakka/shared/core/assets_manager.dart';
import 'package:bakka/shared/core/color_manger.dart';
import 'package:bakka/shared/core/constant_manager.dart';
import 'package:bakka/shared/core/strings_manager.dart';
import 'package:bakka/shared/core/style_manger.dart';
import 'package:bakka/shared/core/valuse_manger.dart';
import 'package:bakka/shared/core/widget/my_app_drawer.dart';
import 'package:bakka/shared/core/widget/toast_app.dart';
import 'package:bakka/features/auth/logic/cubit/auth_cubit.dart';
import 'package:bakka/features/auth/view/register/register_view.dart';
import 'package:bakka/features/auth/view/widget/text_form_app.dart';

import 'package:bakka/shared/data/service/cache_helper.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthLoginSuccessState) {
            if (state.loginModel.status) {
              CacheHelper.saveData(
                      key: "token", value: state.loginModel.data.token)
                  .then((value)   {
                    token= state.loginModel.data.token;
                      Get.off(() => const MainHome());
                  });
              showToast(
                  message: state.loginModel.message,
                  state: ToastStates.SUCCESS);
              //
            } else {
              showToast(
                  message: state.loginModel.message, state: ToastStates.ERROR);
            }
          }
        },
        builder: (context, state) {
          return Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(ImageAssets.login), fit: BoxFit.cover),
            ),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Stack(children: [
                Container(
                  padding: const EdgeInsets.only(left: 35, top: 80),
                  child: const Text(
                    AppStrings.welcome,
                    style: TextStyle(color: Colors.white, fontSize: 33),
                  ),
                ),
                SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.only(
                        right: AppPadding.p22,
                        left: AppPadding.p22,
                        top: AppSize.height * 0.5),
                    child: Form(
                      key: _formKey,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              child: Text(AppStrings.email,
                                  style: getMediumStyle(
                                      color: ColorManger.darkPrimary)),
                            ),
                            CustomFormField(
                              icon: const Icon(Icons.email_outlined),
                              textCtrl: emailController,
                              hint: AppStrings.enterEmail,
                              obscureText: false,
                              validate: (value) {
                                if (value!.isEmpty) {
                                  return AppStrings.pleassEnterEmail;
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: AppSize.s22,
                            ),
                            SizedBox(
                              child: Text(AppStrings.password,
                                  style: getMediumStyle(
                                      color: ColorManger.darkPrimary)),
                            ),
                            CustomFormField(
                              icon: const Icon(Icons.lock),
                              textCtrl: passwordController,
                              suffix: IconButton(
                                icon: Icon(AuthCubit.get(context).suffix),
                                onPressed: () {
                                  AuthCubit.get(context)
                                      .changePasswordVisibility();
                                },
                              ),
                              hint: AppStrings.enterPassword,
                              obscureText: AuthCubit.get(context).isPassword,
                              onChanged: (value) {
                                if (_formKey.currentState!.validate()) {
                                  AuthCubit.get(context).userLogin(
                                    email: emailController.text,
                                    password: passwordController.text,
                                  );
                                }
                              },
                              validate: (value) {
                                if (value!.isEmpty) {
                                  return AppStrings.pleassEnterPassword;
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: AppSize.s40,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(AppStrings.signIn,
                                    style: getBoldStyle(
                                        color: ColorManger.darkColor,
                                        fontSize: AppSize.s22)),
                                ConditionalBuilder(
                                  condition: state is! AuthLoginLoadingState,
                                  builder: (context) => CircleAvatar(
                                    radius: AppSize.s22,
                                    backgroundColor: const Color(0xff4c505b),
                                    child: IconButton(
                                      color: Colors.white,
                                      onPressed: () {
                                        if (_formKey.currentState!.validate()) {
                                          AuthCubit.get(context).userLogin(
                                            email: emailController.text,
                                            password: passwordController.text,
                                          );
                                        }
                                      },
                                      icon: const Icon(Icons.arrow_forward),
                                    ),
                                  ),
                                  fallback: (context) => Center(
                                    child: Image.asset(ImageAssets.loading),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: AppSize.s40,
                            ),
                            Row(children: [
                              Text(
                                AppStrings.dontHaveAccount,
                                style: getSemiBoldStyle(
                                    color: ColorManger.darkColor,
                                    fontSize: AppSize.s14),
                              ),
                              TextButton(
                                onPressed: () {
                                  Get.to(() =>   RegisterView());
                                },
                                child: Text(
                                  AppStrings.signUp,
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    fontSize: AppSize.s18,
                                    color: ColorManger.darkColor,
                                  ),
                                ),
                              ),
                            ]),
                          ]),
                    ),
                  ),
                ),
              ]),
            ),
          );
        },
      ),
    );
  }
}
