import 'package:flutter/material.dart';
import 'list_jadwal_page.dart';
import 'login_page.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  bool _isTugasSelected = false;
  bool _isProjekSelected = false;
  bool _isCatatanSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[50], // Warna cream dominan
        title: Text('Dashboard', style: TextStyle(color: Colors.red[900])), // Warna maroon
        automaticallyImplyLeading: false,
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'profile') {
                _showProfile(context);
              } else if (value == 'logout') {
                _logout(context);
              }
            },
            icon: Icon(Icons.account_circle, color: Colors.red[900]), // Warna maroon
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem<String>(
                  value: 'profile',
                  child: Row(
                    children: [
                      Icon(Icons.account_circle, color: Colors.red[900]), // Warna maroon
                      SizedBox(width: 8),
                      Text('View Profile'),
                    ],
                  ),
                ),
                PopupMenuItem<String>(
                  value: 'logout',
                  child: Row(
                    children: [
                      Icon(Icons.exit_to_app, color: Colors.red[900]), // Warna maroon
                      SizedBox(width: 8),
                      Text('Logout'),
                    ],
                  ),
                ),
              ];
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.amber[50], // Warna cream dominan
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Halo, Aul!',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.red[900]),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Semoga harimu menyenangkan!',
                    style: TextStyle(fontSize: 16, color: Colors.red[900]),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildButton(
                    label: 'Tugasku',
                    isSelected: _isTugasSelected,
                    onPressed: () {
                      setState(() {
                        _isTugasSelected = !_isTugasSelected;
                        _isProjekSelected = false;
                        _isCatatanSelected = false;
                      });
                    },
                  ),
                  _buildButton(
                    label: 'Projek',
                    isSelected: _isProjekSelected,
                    onPressed: () {
                      setState(() {
                        _isProjekSelected = !_isProjekSelected;
                        _isTugasSelected = false;
                        _isCatatanSelected = false;
                      });
                    },
                  ),
                  _buildButton(
                    label: 'Catatan',
                    isSelected: _isCatatanSelected,
                    onPressed: () {
                      setState(() {
                        _isCatatanSelected = !_isCatatanSelected;
                        _isTugasSelected = false;
                        _isProjekSelected = false;
                      });
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context, index) {
                  final cardData = [
                    {
                      "title": "Mobile Programming",
                      "subtitle": "UTS",
                      "date": "17 Oktober 2024",
                      "color": Colors.red[900], // Warna cream dominan
                    },
                    {
                      "title": "Pulau Dewata",
                      "subtitle": "Jalan-jalan",
                      "date": "24 Oktober 2024",
                      "color": Colors.red[700],
                    },
                    {
                      "title": "Menanam Pohon",
                      "subtitle": "Bersih-bersih",
                      "date": "30 Februari 2025",
                      "color": Colors.red[500],
                    },
                    {
                      "title": "Mencuci Sepatu",
                      "subtitle": "Bersih-bersih",
                      "date": "29 Februari 2025",
                      "color": Colors.red[300],
                    },
                  ];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 250,
                      decoration: BoxDecoration(
                        color: cardData[index]["color"] as Color,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              cardData[index]["subtitle"] as String,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.amber[50],
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(cardData[index]["title"] as String, style: TextStyle(color: Colors.amber[50])),
                            SizedBox(height: 5),
                            Text(cardData[index]["date"] as String, style: TextStyle(color: Colors.amber[50])),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Progress',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.red[900], // Warna maroon
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              height: 300,
              child: ListView(
                children: [
                  _buildProgressCard('UTS Studi Islam', '2 hari yang lalu'),
                  _buildProgressCard('Checkout 11.11', '6 hari yang lalu'),
                  _buildProgressCard('Kerja Kelompok', '3 minggu yang lalu'),
                  _buildProgressCard('Mencuci Baju', '1 hari yang lalu'),
                  _buildProgressCard('Memberi Makan Kucing', '4 jam yang lalu'),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.amber[50], // Warna cream dominan
        selectedItemColor: Colors.red[900], // Warna maroon
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Jadwal'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Notifikasi'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
        ],
        onTap: (index) {
          if (index == 0) {
            // Stay on the DashboardPage
          } else if (index == 1) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => ListJadwalPage()));
          } else if (index == 2) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text('Notifikasi'),
                content: Text('Tidak ada notifikasi baru.'),
                actions: [
                  TextButton(onPressed: () => Navigator.pop(context), child: Text('Tutup')),
                ],
              ),
            );
          } else if (index == 3) {
            showSearch(context: context, delegate: CustomSearchDelegate());
          }
        },
      ),
    );
  }

  Widget _buildProgressCard(String title, String subtitle) {
    return Card(
      color: Colors.amber[50], // Warna cream dominan
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: ListTile(
        leading: Icon(Icons.assignment, color: Colors.red[900]), // Warna maroon
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red[900]),
        ),
        subtitle: Text(subtitle),
        trailing: Icon(Icons.more_vert, color: Colors.red[900]),
      ),
    );
  }

  void _showProfile(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('User Profile', style: TextStyle(color: Colors.red[900])),
          content: Text('Profile details can be shown here.', style: TextStyle(color: Colors.black)),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context), child: Text('Close', style: TextStyle(color: Colors.red[900]))),
          ],
        );
      },
    );
  }

  void _logout(BuildContext context) {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
  }

  Widget _buildButton({
    required String label,
    required bool isSelected,
    required VoidCallback onPressed,
  }) {
    return InkWell(
      onTap: onPressed,
      splashColor: Colors.red[900], // Warna maroon
      highlightColor: Colors.red[900]?.withOpacity(0.3),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        decoration: BoxDecoration(
          color: isSelected ? Colors.red[900] : Colors.transparent, // Cream jika dipilih
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          children: [
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.amber[50] : Colors.grey[800], // Maroon jika dipilih
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 5),
            AnimatedCrossFade(
              firstChild: SizedBox.shrink(),
              secondChild: Icon(Icons.arrow_drop_down, color: Colors.amber[50]),
              crossFadeState: isSelected ? CrossFadeState.showSecond : CrossFadeState.showFirst,
              duration: Duration(milliseconds: 200),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(
      child: Text('Masukkan tugas atau catatan untuk mencari.', style: TextStyle(color: Colors.red[900])),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Text('Hasil pencarian akan muncul di sini.', style: TextStyle(color: Colors.red[900])),
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear, color: Colors.red[900]),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back, color: Colors.red[900]),
      onPressed: () {
        close(context, null);
      },
    );
  }
}
