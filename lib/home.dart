import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:app_flutter/detail.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home';  // Untuk menentukan rute navigasi untuk halaman utama

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Untuk menampung data dari REST API
  List<dynamic> items = [];  // dynamic artinya berupa tipe data apapun

  @override
  void initState() {
    super.initState();
    fetchData();  // Untuk mengambil data dari URL REST API
  }

  Future<void> fetchData() async {

    // Mendefinisikan URL dari REST API yang akan diambil datanya
    var URL = 'https://ibnux.github.io/BMKG-importer/cuaca/501186.json';
    final response = await http.get(Uri.parse(URL));  // Untuk permintaan GET ke URL

    // Untuk mengecek apakah permintaan sukses
    if (response.statusCode == 200) {
      setState(() {
        items = jsonDecode(response.body);
      });
    }
  }

  // Fungsi untuk keluar dari aplikasi yang sedang aktif / logout
  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacementNamed(context, '/');  // Untuk mengembalikan ke tampilan awal
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // Menampilkan judul pada bagian atas tampilan
      appBar: AppBar(
        title: Text(
          'Halaman Utama',  // Text judul appBar
          style: TextStyle(
            fontSize: 30,  // Ukuran text judul appBar
            fontWeight: FontWeight.bold,  // Mengatur text judul tebal/bold
          ),
        ),
        centerTitle: true,  // Mengatur posisi text ditengah appBar

        // untuk menampilkan ikon logout sebagai sebuah tombol dibagian appBar
        actions: [
          IconButton(
            icon: Icon(Icons.logout),  // Menampilkan ikon logout
            onPressed: logout,  // Memanggil fungsi logout saat ikon logout diklik
          ),
        ],
      ),
      backgroundColor: Colors.lime,  // Mengatur warna pada latar belakang (Background)

      // Mengatur tampilan ListView daftar secara dinamis
      body: ListView.builder(
        padding: EdgeInsets.all(8),  // Untuk mengatur jarak pada ListView
        itemCount: items.length,  // Mengatur jumlah item berdasarkan banyaknya daftar item
        itemBuilder: (context, index) {
          return GestureDetector(

            // Untuk mengatur item yang diklik dapat berpindah ke halaman detail
            onTap: () {
              Navigator.pushNamed(
                context, DetailPage.routeName, arguments: items[index],
              );
            },

            // Membuat tampilan seperti kartu / card
            child: Card(
              // Mengatur jarak pada tampilan kartu dan warna latar belakang kartu
              margin: EdgeInsets.all(8), color: Colors.lightGreen,

              // Menampilkan text dan konten yang diambil dari url web service / REST API
              child: ListTile(
                title: Text('Waktu :'),  // Menampilkan text
                subtitle: Center(  // Untuk menampilkan konten berada ditengah / center
                  child: Text(
                    items[index]['jamCuaca'],  // Bagian menampilkan konten dari REST API
                    style: TextStyle(
                      fontSize: 24,  // Untuk mengatur ukuran text konten
                      fontWeight: FontWeight.bold,  // Mengatur text tebal / bold
                    ),
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


