import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:app_flutter/firebase_options.dart';
import 'package:app_flutter/home.dart';
import 'package:app_flutter/detail.dart';
import 'package:app_flutter/login.dart';
import 'package:app_flutter/register.dart';

// Fungsi utama yang akan dijalankan saat aplikasi Flutter dimulai
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,  // Mengatur warna tema hijau
      ),
      home: LoginPage(), // Ubah halaman awal menjadi halaman login
      routes: {
        HomePage.routeName: (context) => HomePage(),  // Untu route ke halaman utama
        DetailPage.routeName: (context) => DetailPage(),  // Untuk route ke halaman detail
        RegistrationPage.routeName: (context) => RegistrationPage(), // Untuk route ke halaman registrasi
      },
    );
  }
}
