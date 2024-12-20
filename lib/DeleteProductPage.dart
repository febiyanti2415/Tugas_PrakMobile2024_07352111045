import 'package:flutter/material.dart';

class DeleteProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hapus Produk'),
      ),
      body: Center(
        child: Text(
          'Halaman untuk Menghapus Produk',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
