import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../shared/core/constant_manager.dart';
import '../../../../shared/core/url_manage.dart';
import '../../../../shared/data/service/dio_helper.dart';
import '../../data/model/setting_model.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsInitial());
  static SettingsCubit get(context) => BlocProvider.of(context);

  SettingsModel ? settingsModel;


  void getSettingsData(){
    emit(LoadingSettingsDataState());
    DioHelper.getData(url: AppUrl.settings,token: token ).then((value){
      settingsModel=SettingsModel .fromJson(value.data);
      print(settingsModel!.data );
      emit(SuccessSettingsDataState());

    }).catchError((error){
      emit(ErrorSettingsDataState(error.toString()));

    });

  }
}
