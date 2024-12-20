import 'package:flutter/material.dart';
import 'package:flutter_application_1/AddProductPage.dart';
import 'package:flutter_application_1/DeleteProductPage.dart';
import 'package:flutter_application_1/OrderProductPage.dart'; // Pastikan OrderProductPage diimpor
import 'package:flutter_application_1/login_page.dart';
import 'product_management.dart'; // Halaman untuk fitur "Kelola Produk"
import 'edit_profile_admin.dart'; // Halaman untuk "Edit Profil"
import 'home_page.dart'; // Halaman untuk "Home Page"

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Dashboard'),
        leading: IconButton(
          icon: Icon(Icons.home),
          onPressed: () {
            // Navigasi ke Home Page
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => HomePage()),
            );
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              // Navigasi kembali ke Login Page
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => LoginPage()),
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                'Admin Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ExpansionTile(
              leading: Icon(Icons.production_quantity_limits),
              title: Text('Kelola Produk'),
              children: [
                ListTile(
                  leading: Icon(Icons.add),
                  title: Text('Tambah Produk'),
                  onTap: () {
                    // Aksi untuk menambah produk
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => AddProductPage()),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(Icons.delete),
                  title: Text('Hapus Produk'),
                  onTap: () {
                    // Aksi untuk menghapus produk
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => DeleteProductPage()),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(Icons.shopping_cart),
                  title: Text('Buat Pesanan Produk'),
                  onTap: () {
                    // Aksi untuk membuat pesanan produk
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => OrderProductPage()),
                    );
                  },
                ),
              ],
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Edit Profil'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => EditProfileApp()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Keluar'),
              onTap: () {
                // Navigasi ke Login Page
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => LoginPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text(
          'Selamat Datang di Admin Dashboard!',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
