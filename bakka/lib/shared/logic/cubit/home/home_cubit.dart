import 'package:bakka/features/cart/data/model/change_cart_model.dart';
import 'package:bakka/features/favorite/data/model/change_favorites_model.dart';
import 'package:bakka/features/favorite/data/model/get_favorite_model.dart';
import 'package:bakka/features/home/data/model/home_model.dart';
import 'package:bakka/shared/core/constant_manager.dart';
import 'package:bakka/shared/core/url_manage.dart';
import 'package:bakka/shared/data/service/dio_helper.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../features/auth/data/model/login_model.dart';
import '../../../../features/cart/data/model/get_cart_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);

  HomeModel? homeModel;
  Map<int, bool> favorites = {};
  Map<int, bool> cart = {};
  ChangeFavoriteModel? changeFavoriteModel;
  ChangeCartModel? changeCartModel;
  void getHomeData() {
    emit(LoadingHomeDataState());
    DioHelper.getData(url: AppUrl.home, token: token).then((value) {
      homeModel = HomeModel.fromJson(value.data);

      homeModel!.data.products.forEach((element) {
        favorites.addAll({
          element.id: element.inFavorites,
        });
        cart.addAll({
          element.id: element.inCart,
        });
      });

      emit(SuccessHomeDataState());
    }).catchError((error) {
      emit(ErrorHomeDataState(error.toString()));
    });
  }

  void changeFavorites(int productId) {
    favorites[productId] = !favorites[productId]!;
    emit(ChangeFavoritesState());
    DioHelper.postData(
      url: AppUrl.favorites,
      data: {
        'product_id': productId,
      },
      token: token,
    ).then((value) {
      changeFavoriteModel = ChangeFavoriteModel.fromJson(value.data);
      if (!changeFavoriteModel!.status) {
        favorites[productId] = !favorites[productId]!;
      } else {
        getFavoriteData();
      }
      emit(SuccessFavoritesState(changeFavoriteModel!));
    }).catchError((error) {
      favorites[productId] = !favorites[productId]!;
      emit(ErrorFavoritesState(error));
    });
  }

  FavoriteModel? favoriteModel;

  void getFavoriteData() {
    emit(LoadingGetFavoritesState());
    DioHelper.getData(url: AppUrl.favorites, token: token).then((value) {
      favoriteModel = FavoriteModel.fromJson(value.data);

      emit(GetFavoritesState());
    }).catchError((error) {
      emit(ErrorGetFavoritesState(error.toString()));
    });
  }

  void addToCart(int productId) {
    cart[productId] = !cart[productId]!;
    emit(LoadingChangeCartState());
    DioHelper.postData(
      url: AppUrl.carts,
      data: {
        'product_id': productId,
      },
      token: token,
    ).then((value) {
      changeCartModel = ChangeCartModel.fromJson(value.data);
      if (!changeCartModel!.status) {
        cart[productId] = !cart[productId]!;
      } else {
        getCartData();
      }
      emit(SuccessCartState(changeCartModel!));
    }).catchError((error) {
      cart[productId] = !cart[productId]!;
      emit(ErrorCartState(error));
    });
  }

  CartsModel? cartsModel;

  void getCartData() {
    emit(LoadingGetCartState());
    DioHelper.getData(url: AppUrl.carts, token: token).then((value) {
      cartsModel = CartsModel.fromJson(value.data);

      emit(SuccessGetCartState());
    }).catchError((error) {
      emit(ErrorGetCartState(error.toString()));
    });
  }
  void addMore(int productId) {
    cartsModel!.data.cartItems[productId].quantity++;

    cartsModel!.data.cartItems[productId].product.price =
        cartsModel!.data.cartItems[productId].product.price;

    emit(SuccessAddItemState());
  }

  void removeMore(int productId) {
    if (cartsModel!.data.cartItems[productId].quantity == 1) {
    } else {
      cartsModel!.data.cartItems[productId].quantity--;

      cartsModel!.data.cartItems[productId].product.price =
          cartsModel!.data.cartItems[productId].product.price;
      emit(SuccessRemoveItemState());
    }
  }

  void updateCart(int quantity) {
    emit(LoadingUpdateCartState());
    DioHelper.putData(url: "${AppUrl.carts}/$quantity", token: token, data: {
      "quantity": quantity,
    }).then((value) {
      cartsModel = CartsModel.fromJson(value.data);

      emit(SuccessUpdateCartState(cartsModel!));
    }).catchError((error) {
      print(error.toString());
      emit(ErrorUpdateCartState(error.toString()));
    });
  }

  LoginModel? userData;
  void getUserData() {
    emit(AuthProfileLoadingState());
    DioHelper.getData(url: AppUrl.profile, token: token).then((value) {
      userData = LoginModel.fromJson(value.data);
      emit(ProfileSuccessState(userData!));
    }).catchError((error) {
      print(error.toString());
      emit(AuthProfileErrorState(error.toString()));
    });
  }
}
