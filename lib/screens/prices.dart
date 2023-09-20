import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scrap_saathi/item.dart';

class PricesPage extends StatelessWidget {
  PricesPage({super.key});

  final List<Item> items = [
    Item(name: 'Newspaper', icon: Icons.newspaper, price: '₹ 16/Kg'),
    Item(name: 'Books', icon: Icons.book, price: '₹ 14/Kg'),
    Item(name: 'Cardboard', icon: Icons.add_box, price: '₹ 7/Kg'),
    Item(name: 'Plastic', icon: Icons.shopping_bag, price: '₹ 10/Kg'),
    Item(name: 'Iron', icon: Icons.iron, price: '₹ 27/Kg'),
    Item(name: 'Steel', icon: Icons.restaurant, price: '₹ 37/Kg'),
    Item(name: 'Aluminium', icon: Icons.local_drink_sharp, price: '₹ 105/Kg'),
    Item(name: 'Brass', icon: Icons.notifications, price: '₹ 305/Kg'),
    Item(name: 'Copper', icon: Icons.cable, price: '₹ 425/Kg'),
    Item(name: 'GlassWare', icon: Icons.no_drinks, price: '₹ 10/Kg'),
    Item(name: 'Tyres', icon: Icons.two_wheeler, price: '₹ 80/Kg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: Text(
          "Prices",
          style: GoogleFonts.roboto(
            textStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Container(
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(color: Colors.grey),
            ),
            child: ListTile(
              tileColor: Colors.white,
              leading: Icon(
                item.icon,
                color: Colors.black,
              ),
              title: Text(
                item.name,
                style: GoogleFonts.roboto(
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              trailing: Text(
                item.price,
                style: GoogleFonts.roboto(
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
