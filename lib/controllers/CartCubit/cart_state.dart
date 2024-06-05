part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

class CartListClass extends CartState{
  List<ProductModel>? cartList;
  CartListClass({this.cartList});
}
