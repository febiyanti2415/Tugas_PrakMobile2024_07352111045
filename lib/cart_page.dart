import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          ListTile(
            leading: Image.asset('assets/product_image.png'),
            title: Text("Product Name"),
            subtitle: Text("\$149.00"),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () {},
                ),
                Text("1"),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          Divider(),
          ListTile(
            title: Text("Total:"),
            trailing: Text("\$149.00"),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text("Checkout"),
          ),
        ],
      ),
    );
  }
}
