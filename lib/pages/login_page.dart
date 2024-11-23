import 'package:flutter/material.dart';
import 'dashboard_page.dart'; // Pastikan ini adalah path ke DashboardPage

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[50], // Background cream dominan
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo Clover menggunakan ikon bawaan
                Icon(
                  Icons.local_fire_department, // Ikon yang mirip clover
                  size: 100,
                  color: Colors.red[900], // Warna maroon
                ),
                SizedBox(height: 16),

                // Judul
                Text(
                  "Jadwalku",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.red[900], // Warna maroon
                  ),
                ),
                SizedBox(height: 8),

                // Subjudul
                Text(
                  "Selamat Datang\nLULUK LATIFA AULIA - 4122052",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.red[800], // Warna maroon lebih terang
                  ),
                ),
                SizedBox(height: 32),

                // Input Username
                TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person, color: Colors.red[900]),
                    hintText: "Username",
                    filled: true,
                    fillColor: Colors.white, // Background putih pada input
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(height: 16),

                // Input Password
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock, color: Colors.red[900]),
                    hintText: "Password",
                    filled: true,
                    fillColor: Colors.white, // Background putih pada input
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(height: 24),

                // Tombol Login
                ElevatedButton(
                  onPressed: () {
                    // Navigasi ke DashboardPage
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => DashboardPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red[900], // Warna maroon
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 16),
                    minimumSize: Size(double.infinity, 50), // Lebar tombol penuh
                  ),
                  child: Center(
                    child: Text(
                      "Login",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 16),

                // Divider "or"
                Row(
                  children: [
                    Expanded(child: Divider(color: Colors.grey[400])),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        "or",
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ),
                    Expanded(child: Divider(color: Colors.grey[400])),
                  ],
                ),
                SizedBox(height: 16),

                // Tombol Google
                ElevatedButton.icon(
                  onPressed: () {
                    // Tambahkan aksi untuk login dengan Google
                  },
                  icon: Icon(Icons.email, color: Colors.red[900]),
                  label: Text("Sign in with Google Account"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white, // Background putih
                    foregroundColor: Colors.red[900], // Warna maroon
                    side: BorderSide(color: Colors.red[900]!),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 16),
                    minimumSize: Size(double.infinity, 50), // Lebar tombol penuh
                  ),
                ),
                SizedBox(height: 16),
                // Tombol Phone Number
                ElevatedButton.icon(
                  onPressed: () {
                    // Tambahkan aksi untuk login dengan nomor telepon
                  },
                  icon: Icon(Icons.phone, color: Colors.red[900]), // Ikon telepon
                  label: Text("Sign in with Phone Number"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white, // Background putih
                    foregroundColor: Colors.red[900], // Warna maroon
                    side: BorderSide(color: Colors.red[900]!),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 16),
                    minimumSize: Size(double.infinity, 50), // Lebar tombol penuh
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: LoginPage(),
    debugShowCheckedModeBanner: false,
  ));
}
