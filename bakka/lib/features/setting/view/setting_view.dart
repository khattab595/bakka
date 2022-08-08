import 'package:bakka/features/setting/logic/cubit/settings_cubit.dart';
import 'package:bakka/shared/core/color_manger.dart';
import 'package:bakka/shared/core/strings_manager.dart';
import 'package:bakka/shared/core/valuse_manger.dart';
import 'package:bakka/shared/core/widget/app_bar.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/core/assets_manager.dart';
import '../../../shared/data/service/cache_helper.dart';

class SettingView extends StatelessWidget {
  const SettingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingsCubit, SettingsState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
            appBar: myAppBar(),
            body: ConditionalBuilder(
              condition: SettingsCubit.get(context).settingsModel != null,
              builder: (context) => buildSettingWidget(
                context: context,
                about: SettingsCubit.get(context).settingsModel!.data.about,
                terms: SettingsCubit.get(context).settingsModel!.data.terms,
              ),
              fallback: (context) =>
                  Center(child: Image.asset(ImageAssets.loading)),
            ));
      },
    );
  }

  Widget buildSettingWidget({
    context,
    required String about,
    required String terms,
  }) {
    return Column(
      children: [
        iconAndText(
          onTap: () {
            showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: const Text(AppStrings.about),
                content: Text(about),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'OK'),
                    child: const Text('OK'),
                  ),
                ],
              ),
            );
          },
          icon: Icons.app_blocking_outlined,
          title: AppStrings.about,
        ),
        iconAndText(
          onTap: () {
            showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: const Text(AppStrings.terms),
                content: Text(terms),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'OK'),
                    child: const Text('OK'),
                  ),
                ],
              ),
            );
          },
          icon: Icons.accessibility_sharp,
          title: AppStrings.terms,
        ),
        iconAndText(
          onTap: () {
            singOut();
          },
          icon: Icons.logout,
          title: AppStrings.signOut,
        ),
      ],
    );
  }

  Widget iconAndText(
      {required Function()? onTap,
      required IconData icon,
      required String title}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(left: 20, bottom: 12, top: 40),
        child: Row(
          children: [
            Icon(
              icon,
              size: AppSize.s40,
              color: ColorManger.darkPrimary,
            ),
            const SizedBox(
              width: 12,
            ),
            Text(
              title,
              style: TextStyle(
                  color: ColorManger.darkPrimary,
                  fontSize: AppSize.s20,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
