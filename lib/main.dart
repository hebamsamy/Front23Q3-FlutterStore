import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/Logic/provider/cartProvider.dart';
import 'package:store/Screens/addProductScreen.dart';
import 'package:store/Screens/cartScreen.dart';
import 'package:store/Screens/homeScreen.dart';
import 'package:store/Screens/loginScreen.dart';
import 'package:store/Screens/productListScreen.dart';
import 'package:store/Screens/registerScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CartProvider>(
      create: (context) => CartProvider(),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: "/add-product",
        routes: {
          "/": (context) => HomeScreen(),
          "/register": (context) => RegisterScreen(),
          "/login": (context) => LoginScreen(),
          "/products": (context) => ProductListScreen(),
          "/cart": (context) => CartScreen(),
          "/add-product": (context) => AddProductScreen(),
        },
      ),
    );
  }
}
