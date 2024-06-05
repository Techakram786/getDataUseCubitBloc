import 'package:block_cubit_example/controllers/ProductCubit/product_cubit.dart';
import 'package:block_cubit_example/screens/CartPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controllers/CartCubit/cart_cubit.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<ProductCubit>(context).fetchAllProducts();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:Scaffold(
          body: BlocBuilder<ProductCubit,ProductState>(
            builder: (context,state){
              if(state is ProductFailed){
                return Center(
                  child: Text(state.msg.toString()),
                );
              }
              if(state is ProductSuccess){
                return ListView.builder(
                    itemCount: state.myList!.length,
                    itemBuilder: (context,index){
                      return Container(
                        margin: EdgeInsets.all(16),
                        child: Column(
                          children: <Widget>[
                            Image.network(state.myList![index].image!),
                            Text(state.myList![index].title!),
                            BlocBuilder<CartCubit,CartState>(
                                builder: (context,mystate){
                                  var isProductInCart=BlocProvider.of<CartCubit>(context).checkProductAvailableInCart(state.myList![index]);
                                  return ElevatedButton(
                                      onPressed: ()=>{
                                        if(isProductInCart){
                                          BlocProvider.of<CartCubit>(context).removeCart(state.myList![index])
                                        }else{
                                          BlocProvider.of<CartCubit>(context).addToCart(state.myList![index])
                                        }
                                      },
                                      child: Text(isProductInCart?'remove from cart':'add to cart'));
                                })

                          ],
                        ),
                      );
                    }
                );
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: ()=>{
                 Navigator.push(context, MaterialPageRoute(builder: (_)=>CartPage()))
            },
            child: BlocBuilder<CartCubit,CartState>(
              builder: (context,state){
                if(state is CartListClass){
                  return Text(state.cartList!.length.toString());
                }
                return Text('0');
              },
            ),
          ),
        )
    );
  }
}
