import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../model/ProductModel.dart';
import 'package:http/http.dart'as http;
part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());
  
  Future<void> fetchAllProducts()async{
    try {
      var response=await http.get(Uri.parse('https://fakestoreapi.com/products'));
      var convertedJson=jsonDecode(response.body);
      if(response.statusCode==200){
        emit(ProductSuccess(status: true,msg: 'Product Fetched Successfully',
            myList: (convertedJson as List).map((e)=>ProductModel.fromJson(e)).toList()));
      }
      else{
        emit(ProductFailed(status: false,msg: 'Product Fetched Failed',myList: null));
      }
    } catch (e) {
      emit(ProductFailed(status: false,msg: e.toString(),myList: null));
    }
  }
}
