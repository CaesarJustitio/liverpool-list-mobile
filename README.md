Caesar Justitio - 2206082373

# Tugas 7

## Pertanyaan
### 1. Apa perbedaan utama antara stateless dan stateful widget dalam konteks pengembangan aplikasi Flutter?
- Stateless widget
Widget yang tidak memiliki _state_ sehingga tidak dapat mengubah tampilan atau perilakunya. Stateless widget cocok untuk menampilkan tampilan statis seperti teks, gambar, ikon, tombol yang tidak berubah.
- Stateful widget
Widget yang memiliki _state_. Stateful widget dapat digunakan untuk membuat form, list yang memiliki checkbox, animasi, dan semua komponen yang memerlukan adanya pembaruan tampilan yang dinamis.

### 2. Sebutkan seluruh widget yang kamu gunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing.
- MyHomePage -- tateless Widget
    - Sebagai tampilan utama aplikasi.
    - Menggunakan `Scaffold` untuk membuat kerangka tampilan yang berisi AppBar dan body.
    - `SingleChildScrollView` agar konten di dalamnya dapat di-_scroll_.
    - `Column` untuk menempatkan widgets di dalamnya secara vertikal.
    - `Padding` mengatur space disekitar elemen. 
    - `Text` untuk menampilkan tulisan pada aplikasi.
    - `GridView.count` membuat layout dengan jumlah _tiles_ tetap pada sumbu axis.

- LiverpoolistItem -- Class
    - Kelas yang digunakan untuk merepresentasikan item-item.
    - Kelas ini memiliki dua properti, yaitu _name_ dan _icon_.

- LiverpoolCard -- Stateless Widget
    - Untuk menampilkan setiap item dalam bentuk cards.
    - `Material` sebagai tempat latar belakang untuk cards.
    - `InkWell` untuk menambahkan responsivitas terhadap sentuhan sehingga dapat menampilkan pesan SnackBar ketika card ditekan.
    - `Container` untuk menampilkan ikon dan teks untuk setiap item pakaian.

- MyApp -- Stateless Widget
    - tampilan awal aplikasi yang menginisialisasi MyHomePage.
    - `MaterialApp`, root aplikasi.

## Step-by-step
1. Pertama, saya membuat project Flutter bernama `liverpool_list` dengan perintah.
```
flutter create liverpool_list
```

2. Lalu saya menjalankan `flutter run` pada terminal.

3. Saya membuat file `menu.dart` pada folder `lib`. Saya mengimport `'package:flutter/material.dart'`. 

4. Setelah itu, saya membuat class `LiverpoolistItem` dan `LiverpoolCard` yang adalah stateless widget. Saya juga menerapkan bonus dengan membuat setiap item punya warna berbeda.

```dart
class  LiverpoolistItem {
  final String name;
  final IconData icon;
  final Color color;

  LiverpoolistItem(this.name, this.icon, this.color);
}
```

5. Saya juga membuat widget-widget yang sesuai dan melakukan styling.

```dart
class LiverpoolCard extends StatelessWidget {
  final LiverpoolistItem item;

  const LiverpoolCard(this.item, {super.key}); 

  @override
  Widget build(BuildContext context) { 
    ...
  }
}
```

6. Dalam class MyHomePage, saya membuatnya menjadi stateless widget dan menambahkan beberapa widget didalamnya.
```dart
class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  final List<LiverpoolistItem> items = [
    LiverpoolistItem("Lihat Item", Icons.checkroom_rounded, Colors.red),
    LiverpoolistItem("Tambah Item", Icons.add_box_rounded,Colors.yellow),
    LiverpoolistItem("Logout", Icons.logout, Colors.green),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        ...
    )
  }
}
```

7. Pada `main.dart`, saya memodifikasi default template.

```dart
import 'package:flutter/material.dart';
import 'package:liverpool_list/menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Liverpoolist',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 223, 8, 8)),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}
```