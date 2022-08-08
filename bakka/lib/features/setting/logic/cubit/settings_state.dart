part of 'settings_cubit.dart';

@immutable
abstract class SettingsState {}

class SettingsInitial extends SettingsState {}

class LoadingSettingsDataState extends SettingsState {}

class SuccessSettingsDataState extends SettingsState {}

class ErrorSettingsDataState extends SettingsState {
  final String error;

  ErrorSettingsDataState(this.error);
}
