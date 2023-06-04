import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/Logic/provider/cartProvider.dart';
import 'package:store/Screens/IntroScreen.dart';
import 'package:store/Screens/cartScreen.dart';
import 'package:store/Screens/productListScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int current = 0;
  List<Widget> Screens = [MyWidget(), ProductListScreen(), CartScreen()];
  List<String> titles = ["Home", "Expolere", "Cart"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titles[current]),
        actions: [
          (current == 2)
              ? Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Row(
                    children: [
                      Icon(Icons.monetization_on_sharp),
                      Text('${Provider.of<CartProvider>(context).total}')
                    ],
                  ),
                )
              : Text("")
        ],
      ),
      body: Screens[current],
      bottomNavigationBar: BottomNavigationBar(
          onTap: (val) {
            setState(() {
              current = val;
            });
          },
          currentIndex: current,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopify), label: "Products"),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                label: "Cart ${Provider.of<CartProvider>(context).count}"),
          ]),
    );
  }
}
