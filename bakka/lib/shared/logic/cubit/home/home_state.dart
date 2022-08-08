part of 'home_cubit.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class LoadingHomeDataState extends HomeState {}

class SuccessHomeDataState extends HomeState {}

class ErrorHomeDataState extends HomeState {
  final String error;

  ErrorHomeDataState(this.error);
}

class SuccessFavoritesState extends HomeState {
  final ChangeFavoriteModel model;

  SuccessFavoritesState(this.model);
}

class ChangeFavoritesState extends HomeState {}

class GetFavoritesState extends HomeState {}

class LoadingGetFavoritesState extends HomeState {}

class ErrorFavoritesState extends HomeState {
  final String error;

  ErrorFavoritesState(this.error);
}

class ErrorGetFavoritesState extends HomeState {
  final String error;

  ErrorGetFavoritesState(this.error);
}

class AuthProfileLoadingState extends HomeState {}

class ProfileSuccessState extends HomeState {
  final LoginModel loginModel;

  ProfileSuccessState(this.loginModel);
}

class AuthProfileErrorState extends HomeState {
  final String error;

  AuthProfileErrorState(this.error);
}

class SuccessCartState extends HomeState {
  final ChangeCartModel model;

  SuccessCartState(this.model);
}

class LoadingChangeCartState extends HomeState {}

class SuccessGetCartState extends HomeState {

}

class LoadingGetCartState extends HomeState {}

class ErrorCartState extends HomeState {
  final String error;

  ErrorCartState(this.error);
}

class ErrorGetCartState extends HomeState {
  final String error;

  ErrorGetCartState(this.error);
}

class SuccessAddItemState extends HomeState {}

class SuccessRemoveItemState extends HomeState {}

class SuccessGetTotalItemState extends HomeState {}

class SuccessUpdateCartState extends HomeState {
  final CartsModel cartModel;

  SuccessUpdateCartState(this.cartModel);
}

class LoadingUpdateCartState extends HomeState {}

class ErrorUpdateCartState extends HomeState {
  final String error;

  ErrorUpdateCartState(this.error);
}


//
// void updateCart(int quantity) {
//   emit(LoadingUpdateCartState());
//   DioHelper.putData(url: "${AppUrl.carts}/$quantity", token: token, data: {
//     "quantity": quantity,
//   }).then((value) {
//     cartsModel = CartsModel.fromJson(value.data);
//
//     emit(SuccessUpdateCartState(cartsModel!));
//   }).catchError((error) {
//     print(error.toString());
//     emit(ErrorUpdateCartState(error.toString()));
//   });
// }