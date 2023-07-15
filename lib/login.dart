import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:app_flutter/home.dart';
import 'package:app_flutter/register.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();  // Mengontrol inputan email
  final TextEditingController _passwordController = TextEditingController();  // Mengontrol inputan password

  Future<void> signIn(BuildContext context) async {  // Untuk proses autentikasi sebelum masuk ke halaman utama
    try {

      // Untuk melakukan autentikasi dengan email dan password dari pengguna
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      print('Logged in: ${userCredential.user!.uid}');  // Untuk menampilkan ID pengguna yang berhasil masuk
      Navigator.pushReplacementNamed(context, HomePage.routeName); // Untuk pindah ke halaman utama setelah login
    } on FirebaseAuthException catch (e) {  // Untuk menampilkan pesan kesalahan jika gagal saat autentikasi
      print('Error: $e');  // Pesan error yang ditampilkan
    }
  }

  // Fungsi untuk mengarahkan ke halaman pendaftaran / registrasi
  void goToRegistration(BuildContext context) {
    Navigator.pushNamed(context, RegistrationPage.routeName);  // Kearah pendaftaran / registrasi
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // Untuk membuat judul dibagian atas halaman
      appBar: AppBar(
        title: Text(
          'Halaman Login',  // Bagian text judul yang ditampilkan diappBar
          style: TextStyle(
            fontSize: 25,  // Ukuran text judul tampilan
            fontWeight: FontWeight.bold,  // Mengatur tebal text / bold
          ),
        ),
        centerTitle: true,  // Mengatur posisi text ditengah appBar
      ),
      body: Padding(
        padding: EdgeInsets.all(16),  // Mengatur jarak konten dengan tepi
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,  // Mengatur tampilan ditengah / center
          children: [
            Text(
              'Selamat Datang',  // Menampilkan text "Selamat Datang"
              style: TextStyle(
                fontSize: 30,  // Ukuran text "Selamat Datang"
                fontWeight: FontWeight.bold,  // Mengatur tebal text / bold
              ),
            ),

            SizedBox(height: 50),  // Untuk memberi jarak

            // Untuk membuat input teks yang dapat diisi berupa email
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',  // Label untuk memudahkan pengisian agar tidak salah
              ),
            ),

            SizedBox(height: 8),  // Untuk memberi jarak antara email dengan password

            // Untuk membuat input teks yang dapat diisi berupa password
            TextField(
              controller: _passwordController,
              obscureText: true,  // Untuk menyembunyikan password
              decoration: InputDecoration(
                labelText: 'Password',  // Label untuk memudahkan pengisian agar tidak salah
              ),
            ),
            SizedBox(height: 32),  // Untuk memberi jarak antara password dengan tombol
            ElevatedButton(
              onPressed: () => signIn(context),  // Aksi yang akan dijalankan saat tombol diklik
              child: Text('Masuk'),
            ),
            SizedBox(height: 8),  // Untuk memberi jarak antara tombol masuk dengan text daftar
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Belum punya akun ?'),  // Menampilkan text "Belum punya akun ?"
                TextButton(
                  onPressed: () => goToRegistration(context),  // Aksi yang akan dijalankan saat tombol diklik
                  child: Text('Daftar'),  // Untuk menampilkan tombol dengan text "Daftar"
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

