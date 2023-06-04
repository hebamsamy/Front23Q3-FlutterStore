import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/Logic/provider/cartProvider.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(builder: (context, prov, child) {
      return ListView.builder(
        itemCount: prov.count,
        itemBuilder: ((context, index) {
          return Card(
            child: Dismissible(
              background: Container(
                child: Icon(Icons.delete),
                alignment: Alignment.centerRight,
                color: Colors.red,
              ),
              onDismissed: (direction) {
                var temp = prov.cartList[index];
                prov.remove(prov.cartList[index]);

                var msg = SnackBar(
                    content: const Text('Yay! A SnackBar!'),
                    action: SnackBarAction(
                      label: 'Undo',
                      onPressed: () {
                        prov.undo(temp);
                      },
                    ));
                ScaffoldMessenger.of(context).showSnackBar(msg);
              },
              key: ValueKey(prov.cartList[index].id),
              child: ListTile(
                title: Text(prov.cartList[index].product.name),
                subtitle: Row(children: [
                  IconButton(
                      onPressed: () {
                        prov.incement(prov.cartList[index].product);
                      },
                      icon: Icon(Icons.add)),
                  Text(prov.cartList[index].qty.toString()),
                  IconButton(
                      onPressed: () {
                        prov.decement(prov.cartList[index].product);
                      },
                      icon: Icon(Icons.minimize)),
                ]),
              ),
            ),
          );
        }),
      );
    });
  }
}
