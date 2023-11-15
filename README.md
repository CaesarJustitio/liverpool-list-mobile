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

# Tugas 8

## Pertanyaan
### 1. Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement(), disertai dengan contoh mengenai penggunaan kedua metode tersebut yang tepat!
- Navigator.push()
Dipergunakan untuk mendorong halaman baru ke dalam stack navigator, sehingga tetap mempertahankan halaman sebelumnya. Pengguna dapat kembali ke halaman sebelumnya melalui tombol kembali atau dengan secara eksplisit memanggil fungsi Navigator.pop(). Pendekatan ini berguna ketika ingin memberikan kemampuan kepada pengguna untuk melakukan navigasi "kembali".

```dart
Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => Page()),
);
```

- Navigator.pushReplacement()
Menggantikan halaman saat ini dalam stack dengan halaman baru, menghapus halaman sebelumnya dari stack sehingga pengguna tidak dapat kembali ke halaman sebelumnya. 

```dart
Navigator.pushReplacement(
  context,
  MaterialPageRoute(builder: (context) => Page()),
);
```


### 2. Jelaskan masing-masing layout widget pada Flutter dan konteks penggunaannya masing-masing!
- Row
Mengatur childnya secara horizontal dalam sebuah baris tunggal untuk layout yang membutuhkan susunan horizontal.

- Column
Mengatur childnya secara vertikal dalam sebuah kolom tunggal untuk tampilan yang membutuhkan susunan vertikal.

- Container
Widget yang menggabungkan common painting, positioning, dan sizing widgets digunakan untuk blok bangunan dasar untuk membuat bentuk, mengatur padding, margin, menambahkan background, dan masih banyak yang lainnya.

- Stack
Memungkinkan childnya ditumpuk satu di atas yang lain untuk overlay seperti menempatkan badge di atas ikon.

- Padding
Memberikan padding pada widget childnya untuk memberi ruang tambahan di sekitar widget.

- Align
Menyamakan widget childnya sesuai dengan parameter alignment yang diberikan untuk menempatkan widget pada posisi tertentu dalam container.

- ListView
Membuat list scrollable dari widget childnya untuk membuat list yang panjang dan bisa discroll.

- GridView
Membuat grid dua dimensi dari widget childnya untuk menampilkan data dalam bentuk grid seperti galeri gambar.


### 3. Sebutkan apa saja elemen input pada form yang kamu pakai pada tugas kali ini dan jelaskan mengapa kamu menggunakan elemen input tersebut!
- TextFormField untuk "Nama Pemain"
Digunakan agar user bisa memasukkan nama pemain pakaian dengan tipe text biasa dan ada pengecekan untuk memastikan bahwa field tidak kosong.

- TextFormField untuk "Klub Asal"
Digunakan agar user bisa memasukkan klub asal pakaian dengan tipe text biasa dan ada pengecekan untuk memastikan bahwa field tidak kosong.

- TextFormField untuk "Harga Transfer Pemain"
Digunakan agar user bisa memasukkan harga transfer pakaian dengan tipe text biasa dan ada pengecekan untuk memastikan bahwa field tidak kosong.

- TextFormField untuk "Posisi Pemain"
Digunakan agar user bisa memasukkan posisi pemain pakaian dengan tipe text biasa dan ada pengecekan untuk memastikan bahwa field tidak kosong.

- TextFormField untuk "Jumlah Goal Pemain"
Digunakan agar user bisa memasukkan jumlah goal pemain pakaian dengan tipe text biasa dan ada pengecekan untuk memastikan bahwa field tidak kosong.


### 4. Bagaimana penerapan clean architecture pada aplikasi Flutter?
Implementasi Clean Architecture pada aplikasi Flutter melibatkan pembagian kode ke dalam lapisan yang berbeda dengan tanggung jawab yang terdefinisi dengan jelas, dengan tujuan meningkatkan kemudahan pemeliharaan (maintainability) dan kemampuan pengujian (testability).

Prinsip umum Clean Architecture_ di Flutter:
1. Independent of Frameworks: Logika pemrograman aplikasi harus mandiri dan tidak terkait secara eksklusif dengan Flutter itu sendiri.

2. Testable: Logika pemrograman dapat diuji tanpa bergantung pada UI, database, server, atau alat eksternal lainnya.

3. Independent of UI: UI pengguna dapat mengalami perubahan tanpa mempengaruhi lapisan lainnya.

4. Independent of Database: Database dapat diganti tanpa memodifikasi logika pemrograman.

5. Independent of any external agency: Logika pemrograman tidak perlu mengetahui tentang entitas eksternal seperti database atau Web API.

Saya memisahkan kode menjadi beberapa direktori, seperti pada lib saya membagi screens dan widgets untuk memudahkan pengelolaan kode, pengujian, dan pemeliharaan kode.


### Step-by-step
- Membuat halaman baru pada aplikasi: Saya membuat file `liverpoolist_form.dart` pada direnktori `lib/screens`.

Elemen input yang saya buat adalah name, formerclub, marketprice, position, dan goals dengan TextFormField yang dibungkus Padding. 

Saya juga menambah tombol save untuk menyimpan input dari form.
```dart
child: const Text(
  "Save",
  style: TextStyle(color: Colors.white),
)
```

Setiap elemen input di formulir divalidasi agar tidak kosong dan sesuai data type modelnya.
```dart
validator: (String? value) {
  if (value == null || value.isEmpty) { 
    return "Error Message"; 
  }
  if (int.tryParse(value) == null) {
    return "Amount has to be a number!"; 
  }
  return null;
},
```

- Mengarahkan pengguna ke halaman form tambah item baru ketika menekan tombol `Add New Item` pada halaman utama.
```dart
if (item.name == "Add New Player") {
  Navigator.push(context,
    MaterialPageRoute(builder: (context) => const ShopFormPage()));
}
```


- Memunculkan data sesuai isi dari formulir yang diisi dalam sebuah pop-up setelah menekan tombol Save pada halaman formulir tambah item baru.
Saat pengguna mengeksekusi perintah `Save`, aplikasi akan menjalankan proses validasi, dan jika seluruh data terbukti benar, sistem akan menampilkan jendela dialog pop-up yang menampilkan informasi sesuai dengan input yang telah diisi oleh pengguna dalam formulir. Saat tombol `OK` ditekan, dialog akan ditutup melalui pemanggilan fungsi Navigator.pop(context), yang menghapus tampilan AlertDialog dari layar. Setelah jendela dialog muncul, langkah `_formKey.currentState!.reset()` akan digunakan untuk mengosongkan formulir, sehingga formulir tidak lagi menyimpan data sebelumnya.

```dart
onPressed: () {
  if (_formKey.currentState!.validate()) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Pemain berhasil ditransfer ke LIIVERPOOL'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Nama: $_name'),
                Text('Asal Klub: $_formerclub'),
                Text('Harga: $_marketprice'),
                Text('Posisi: $_position'),
                Text('Jumlah Goal: $_goals'),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
    _formKey.currentState!.reset();
```

- Membuat sebuah drawer
Saya membuat file `left_drawer.dart` pada lib/widgets. 
Lalu, saya membuat 2 opsi untuk ke halaman utama dan tambah item dalam ListTile anak dari ListView.
Ketika salah satu opsi ditekan, `Navigator.pushReplacement` akan navigasi ke halaman yang sesuai.
```dart
Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.red,
            ),
            child: Column(
              children: [
                Text(
                  'Liverpool List',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Text(
                  "Bawa Pemain Idolamu ke LIVERPOOL!",
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Halaman Utama'),
            // Bagian redirection ke MyHomePage
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(),
                  ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_shopping_cart),
            title: const Text('Tambah Item'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ShopFormPage(),
                  ));
            },
          ),
```


### Penerapan Bonus

- Pembuatan show_data_page.dart

```dart
class PlayerListPage extends StatefulWidget {
  const PlayerListPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PlayersPageState();
}

class _PlayersPageState extends State<PlayerListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'List Player',
          ),
        ),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: ListView.builder(
        itemCount: players.length,
        itemBuilder: (context, index) {
          final player = players[index];
          return LivCard(player: player);
        },
      ),
    );
  }
}

class LivCard extends StatelessWidget {
  final Player player;

  const LivCard({Key? key, required this.player}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showModalBottomSheet(context, player),
      child: Card(
        margin: const EdgeInsets.all(16.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                player.name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }

  void _showModalBottomSheet(BuildContext context, Player player) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Align(
          alignment: FractionalOffset.bottomCenter,
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(player.name,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                Text('Nama: ${player.name}'),
                Text('Asal Klub: ${player.formerclub}'),
                Text('Harga: ${player.marketprice}'),
                Text('Posisi: ${player.position}'),
                Text('Jumlah Goal: ${player.goals}'),

                const SizedBox(height: 20),
                ElevatedButton(
                  child: const Text('Close'),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
```

- Pembuatan Penyimpanan Data
```dart
List<Player> players = [];
```

- Penambahan Data ke penyimpanan
```dart
if (_formKey.currentState!.validate()) {
  players.add(Player(
          name: _name,
          formerclub: _formerclub,
          marketprice: _marketprice,
          position: _position,
          goals: _goals,
        ));
```

- Menambahkan drawer

```dart
ListTile(
  leading: const Icon(Icons.checklist),
  title: const Text('Lihat Pemain'),
  onTap: () {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PlayerListPage()
        ));
  },
),
```

- Menambah Routingan pada card (menu homepage)
```dart
if (item.name == "Lihat Pemain") {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => PlayerListPage()),
  );
};
```