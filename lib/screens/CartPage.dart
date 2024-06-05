import 'package:block_cubit_example/controllers/CartCubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('My Cart'),
          ),
          body: BlocBuilder<CartCubit,CartState>(
            builder: (context,state){
              if(state is CartListClass){
                return state.cartList!.isEmpty?Center(child: Text('No Items')):
                ListView.builder(
                    itemCount: state.cartList!.length,
                    itemBuilder: (context,index){
                      return Container(
                        child: Row(
                          children: <Widget>[
                            Image.network(state.cartList![index].image!,height: 40,width: 40,),
                            Expanded(child: Text(state.cartList![index].title!)),
                            InkWell(
                              onTap: ()=>{
                                BlocProvider.of<CartCubit>(context).removeCart(state.cartList![index])
                              },
                                child: Text('x',style: TextStyle(fontSize: 30,color: Colors.red),))
                          ],
                        ),
                      );
                    }
                );
              }
              return Center(
                child: CircularProgressIndicator()
              );
            },
          ),
        )
    );
  }
}
