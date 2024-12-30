// Import package yang diperlukan
import 'package:flutter/material.dart'; // Package utama Flutter untuk UI
import 'screens/login_screen.dart'; // Import halaman login
import 'screens/register_screen.dart'; // Import halaman register

// Fungsi main sebagai entry point aplikasi
void main() => runApp(MyApp()); // Menjalankan aplikasi dengan MyApp sebagai root widget

// Class MyApp - Widget utama aplikasi
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Offline Auth', // Judul aplikasi
      theme: ThemeData(primarySwatch: Colors.blue), // Tema aplikasi menggunakan warna biru
      initialRoute: '/login', // Rute awal aplikasi ke halaman login
      routes: {
        // Mendefinisikan rute-rute dalam aplikasi
        '/login': (context) => LoginScreen(), // Rute ke halaman login
        '/register': (context) => RegisterScreen(), // Rute ke halaman register
      },
    );
  }
}

// Class Dashboard - Halaman dashboard setelah login
class Dashboard extends StatelessWidget {
  final String encryptedUsername; // Menyimpan username terenkripsi
  
  // Constructor dengan parameter wajib encryptedUsername
  Dashboard({required this.encryptedUsername});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dashboard')), // App bar dengan judul Dashboard
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Mengatur alignment ke tengah secara vertikal
          children: [
            // Text selamat datang
            Text(
              'Welcome to the Dashboard!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16), // Memberikan jarak vertikal 16 pixel
            // Menampilkan username terenkripsi
            Text(
              'Encrypted Account: $encryptedUsername',
              style: TextStyle(fontSize: 16, color: Colors.blue),
            ),
            // Tombol untuk navigasi ke halaman register
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/register'); // Navigasi ke halaman register
              },
              child: Text(
                'Don't have an account? Register',
                style: TextStyle(color: Colors.blue),
              ),
            ),
            // Tombol untuk navigasi ke halaman login
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login'); // Navigasi ke halaman login
              },
              child: Text(
                'Already have an account? Login here',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}