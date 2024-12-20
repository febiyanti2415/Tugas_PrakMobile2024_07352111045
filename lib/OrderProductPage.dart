import 'package:flutter/material.dart';

class OrderProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buat Pesanan Produk'),
      ),
      body: Center(
        child: Text(
          'Halaman untuk Membuat Pesanan Produk',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
