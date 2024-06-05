import 'package:block_cubit_example/controllers/CartCubit/cart_cubit.dart';
import 'package:block_cubit_example/controllers/ProductCubit/product_cubit.dart';
import 'package:block_cubit_example/screens/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<ProductCubit>(create: (_)=>ProductCubit()),
          BlocProvider<CartCubit>(create: (_)=>CartCubit())
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: HomePage(),
        )
    );
  }
}

