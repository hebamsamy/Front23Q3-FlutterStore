import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/Logic/ProductHelper.dart';
import 'package:store/Logic/provider/cartProvider.dart';
import 'package:store/Models/product.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  var api = ProductApiHelper();
  List<Product> returnedList = [];

  @override
  getData() async {
    var x = await api.getAll();
    setState(() {
      returnedList = x;
    });
  }

  void initState() {
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1 / 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20),
      children: returnedList.map((e) => ProductItem(prd: e)).toList(),
    );
  }
}

class ProductItem extends StatelessWidget {
  ProductItem({required this.prd});
  Product prd;
  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: InkWell(
        splashColor: Color.fromARGB(104, 220, 214, 214),
        onTap: () {
          print(prd.id);
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(
            prd.imgURL,
            fit: BoxFit.cover,
          ),
        ),
      ),
      footer: GridTileBar(
        backgroundColor: Color.fromARGB(104, 220, 214, 214),
        title: Text(prd.name),
        trailing: IconButton(
          onPressed: () {
            Provider.of<CartProvider>(context, listen: false).add(prd);
          },
          icon: Icon(
            Icons.shopping_bag_rounded,
            color: Colors.white,
          ),
        ),
        leading: Icon(
          Icons.favorite,
          color: Colors.red,
        ),
      ),
    );
  }
}
