import 'package:flutter/material.dart';
import 'package:liverpool_list/screens/liverpoolist_form.dart';
import 'package:liverpool_list/screens/show_data_page.dart';

class LiverpoolistItem {
  final String name;
  final IconData icon;

  LiverpoolistItem(this.name, this.icon);
}

class Player {
  final String name;
  final String formerclub;
  final int marketprice;
  final String position;
  final int goals;

  Player({
    required this.name,
    required this.formerclub,
    required this.marketprice,
    required this.position,
    required this.goals,
  });
}

class LiverpoolCard extends StatelessWidget {
  final LiverpoolistItem item;

  const LiverpoolCard(this.item, {super.key}); // Constructor

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.red,
      child: InkWell(
        onTap: () {
          // Memunculkan SnackBar ketika diklik
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));

          if (item.name == "Tambah Pemain") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ShopFormPage()),
            );
          };

          if (item.name == "Lihat Pemain") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PlayerListPage()),
            );
          };
        },
        child: Container(
          // Container untuk menyimpan Icon dan Text
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}