import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:app_flutter/home.dart';

class RegistrationPage extends StatelessWidget {
  static const routeName = '/register';

  final TextEditingController _emailController = TextEditingController();  // Mengontrol inputan email
  final TextEditingController _passwordController = TextEditingController();  // Mengontrol inputan password

  Future<void> register(BuildContext context) async {  // Untuk proses autentikasi
    try {

      // Untuk melakukan autentikasi dengan email dan password yang didaftarkan pengguna
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      print('Registered user: ${userCredential.user!.uid}');  // Untuk menampilkan ID pengguna yang berhasil terdaftar
      Navigator.pushReplacementNamed(context, HomePage.routeName);  // Untuk pindah ke halaman utama setelah mendaftar
    } on FirebaseAuthException catch (e) {  // Untuk menampilkan pesan kesalahan jika gagal saat autentikasi
      print('Error: $e');  // Pesan error yang ditampilkan
    }
  }

  // Fungsi untuk mengarahkan ke halaman login
  void goToLogin(BuildContext context) {
    Navigator.pop(context); // Kembali ke halaman login
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // Untuk membuat judul dibagian atas halaman
      appBar: AppBar(
        title: Text(
          'Halaman Registrasi',  // Bagian text judul yang ditampilkan diappBar
          style: TextStyle(
            fontSize: 25,  // Ukuran text judul tampilan
            fontWeight: FontWeight.bold,  // Mengatur tebal text / bold
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),  // Mengatur jarak konten dengan tepi
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,  // Mengatur tampilan ditengah / center
          children: [
            Text(
              'Form Pendaftaran Akun',  // Menampilkan text "Form Pendaftaran Akun"
              style: TextStyle(
                fontSize: 30,  // Ukuran text "Form Pendaftaran Akun"
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
              onPressed: () => register(context),  // Aksi yang akan dijalankan saat tombol diklik
              child: Text('Daftar'),
            ),
            SizedBox(height: 8),  // Untuk memberi jarak antara tombol daftar dengan text masuk
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Sudah punya akun ?'),  // Menampilkan text "Sudah punya akun ?"
                TextButton(
                  onPressed: () => goToLogin(context),  // Aksi yang akan dijalankan saat tombol diklik
                  child: Text('Masuk'),  // Untuk menampilkan tombol dengan text "Masuk"
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

