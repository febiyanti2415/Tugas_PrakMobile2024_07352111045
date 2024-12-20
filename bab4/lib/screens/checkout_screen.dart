import 'package:flutter/material.dart';
import 'package:bab4/widget/chart_item.dart';
import 'package:bab4/helpers/format_helper.dart';

class CheckoutScreen extends StatefulWidget {
  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  List<Map<String, dynamic>> _product = [
    {
      "img": "assets/img/jaket.jpeg",
      "name": "Jaket",
      "brand": "Timnas",
      "price": 40,
      "count": 1
    },
    {
      "img": "assets/img/jaket2.jpeg",
      "name": "Jaket",
      "brand": "Timnas",
      "price": 333,
      "count": 1
    },
    {
      "img": "assets/img/indo.jpeg",
      "name": "Jersey",
      "brand": "Timnas",
      "price": 50,
      "count": 1
    }
  ];

  double get subtotal =>
      _product.fold(0, (sum, item) => sum + (item['price'] * item['count']));

  int get discount => _product.isEmpty? 0 :4;
  int get delivery => _product.isEmpty? 0 :2;

  double get total => subtotal - discount + delivery;

  // Fungsi untuk mengupdate jumlah produk
  void updateProductCount(int index, int change) {
    setState(() {
      _product[index]['count'] += change;
      if (_product[index]['count'] < 1)
        _product[index]['count'] = 1; // Minimum 1
    });
  }

  void removeProduct(int index){
    setState(() {
      _product.removeAt(index);
      if(_product.isEmpty){
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('ALL items removed!')));
      }
    }); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Cart')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _product.length,
                itemBuilder: (context, index) {
                  return ChartItem(
                    imagePath: _product[index]['img'],
                    name: _product[index]['name'],
                    brand: _product[index]['brand'],
                    price: _product[index]['price'],
                    count: _product[index]['count'],
                    onMin: () => updateProductCount(index, -1), // Tombol -
                    onPlus: () => updateProductCount(index, 1), // Tombol +
                    onRemove: () => removeProduct(index),
                  );
                },
              ),
            ),
            // Divider(),
            Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: Color.fromARGB(40, 158, 158, 158)),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Order Summary',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    OrderSummaryRow(label: 'Items', value: '${_product.length}'),
                    OrderSummaryRow(
                        label: 'Subtotal', value: formatToRupiah(subtotal)),
                    OrderSummaryRow(
                        label: 'Discount', value: formatToRupiah(discount)),
                    OrderSummaryRow(
                        label: 'Delivery Charges', value: formatToRupiah(delivery)),
                    Divider(),
                    OrderSummaryRow(
                        label: 'Total',
                        value: formatToRupiah(total),
                        isBold: true),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        backgroundColor: Colors.blueAccent,
                      ),
                      child: Center(
                        child: Text(
                          'Check Out',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OrderSummaryRow extends StatelessWidget {
  final String label;
  final String value;
  final bool isBold;

  const OrderSummaryRow({
    Key? key,
    required this.label,
    required this.value,
    this.isBold = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 14,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
