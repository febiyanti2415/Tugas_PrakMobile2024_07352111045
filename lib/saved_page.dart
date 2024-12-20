import 'package:flutter/material.dart';

class SavedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 0.75,
        ),
        itemBuilder: (context, index) {
          return Card(
            child: Column(
              children: [
                Expanded(
                  child: Image.asset('assets/product_image.png', fit: BoxFit.cover),
                ),
                const SizedBox(height: 5),
                Text("Product Name"),
                Text("\$149.00"),
              ],
            ),
          );
        },
        itemCount: 6, // Ganti dengan jumlah produk sebenarnya
      ),
    );
  }
}
