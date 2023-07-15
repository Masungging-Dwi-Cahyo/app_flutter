import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  static const routeName = '/detail';  // Untuk menentukan rute navigasi untuk halaman detail

  @override
  Widget build(BuildContext context) {
    final item = ModalRoute.of(context)!.settings.arguments as dynamic;

    return Scaffold(

      // Untuk membuat judul dibagian atas halaman
      appBar: AppBar(
        title: Text(
          'Halaman Detail',  // Bagian text judul yang ditampilkan diappBar
          style: TextStyle(
            fontSize: 25,  // Ukuran text judul tampilan
            fontWeight: FontWeight.bold,  // Mengatur tebal text / bold
          ),
        ),
      ),

      // Untuk menampilkan konten
      body: SingleChildScrollView( // Menggunakan SingleChildScrollView untuk mengatasi overflow
        padding: EdgeInsets.all(16), // Mengatur jarak konten dengan tepi
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,  // Mengatur tampilan ditengah / center
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 16),  // Mengatur jarak gambar dengan garis
              child: Image.asset(
                'assets/logo.png',  // Gambar yang ditampilkan dihalaman detail
                height: 300,  // Mengatur ukuran tinggi gambar
                width: 300,  // Mengatur ukuran lebar gambar
              ),
            ),

            // Menambahkan garis sebagai pemisah antara gambar dengan text
            Divider(
              color: Colors.black,
              thickness: 5,  // Mengatur tebal garis
              indent: 8,  // Mengatur jarak dari sisi kiri
              endIndent: 8,  // Mengatur jarak dari sisi kanan
            ),

            // Konten yang ditampilkan pada halaman detail
            SizedBox(height: 16),  // Untuk memberi jarak antara garis pemisah dan teks
            Text(item['jamCuaca'],
              style: TextStyle(
                fontSize: 40,  // Untuk mengatur ukuran text konten
                fontWeight: FontWeight.bold,  // Mengatur text tebal / bold
              ),
            ),
            SizedBox(height: 16),// Untuk memberi jarak antar text
            Text(item['cuaca'],
              style: TextStyle(
                fontSize: 30,  // Untuk mengatur ukuran text konten
                fontWeight: FontWeight.bold,  // Mengatur text tebal / bold
              ),
            ),
            SizedBox(height: 16),// Untuk memberi jarak antar text

            // Membuat tampilan suhu celsius dan fahrenheit
            Text(item['tempC']+ "\u2103 " +'atau '+ item['tempF']+ "\u2109",
              style: TextStyle(
                fontSize: 30,  // Untuk mengatur ukuran text konten
                fontWeight: FontWeight.bold,  // Mengatur text tebal / bold
              ),
            ),
          ],
        ),
      ),
    );
  }
}
