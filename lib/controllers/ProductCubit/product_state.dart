part of 'product_cubit.dart';

@immutable
sealed class ProductState {}

final class ProductInitial extends ProductState {}

class ProductSuccess extends ProductState{
  bool? status;
  String? msg;
  List<ProductModel>? myList;

  ProductSuccess({this.status,this.msg,this.myList});
}
class ProductFailed extends ProductState{
  bool? status;
  String? msg;
  List<ProductModel>? myList;

  ProductFailed({this.status,this.msg,this.myList});
}
