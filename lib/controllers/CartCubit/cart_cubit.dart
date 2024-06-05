import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../model/ProductModel.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  List<ProductModel>? cartList=[];

  addToCart(ProductModel productModel){
    cartList!.add(productModel);
    emit(CartListClass(cartList: cartList));
  }

  removeCart(ProductModel productModel){
    cartList!.remove(productModel);
    emit(CartListClass(cartList: cartList));
  }

  bool checkProductAvailableInCart(ProductModel productModel){
    return cartList!.contains(productModel);
  }
}
