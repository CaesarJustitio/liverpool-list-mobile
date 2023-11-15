import 'package:flutter/material.dart';
import 'package:liverpool_list/widgets/left_drawer.dart';
import 'package:liverpool_list/widgets/liv_card.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  final List<LiverpoolistItem> items = [
    LiverpoolistItem("Lihat Pemain", Icons.checklist),
    LiverpoolistItem("Tambah Pemain", Icons.add_shopping_cart),
    LiverpoolistItem("Logout", Icons.logout),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Liverpool List',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
      ),
      drawer: const LeftDrawer(),
      body: SingleChildScrollView(
        // Widget wrapper yang dapat discroll
        child: Padding(
          padding: const EdgeInsets.all(10.0), 
          child: Column(
            // Widget untuk menampilkan children secara vertikal
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Text(
                  'Liverpool Shop', 
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // Grid layout
              GridView.count(
                // Container pada card kita.
                primary: true,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                shrinkWrap: true,
                children: items.map((LiverpoolistItem item) {
                  // Iterasi untuk setiap item
                  return LiverpoolCard(item);
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}