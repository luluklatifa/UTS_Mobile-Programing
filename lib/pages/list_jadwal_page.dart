import 'package:flutter/material.dart';
import 'package:uts_mp/pages/login_page.dart';
import 'create_task_page.dart';
import 'dashboard_page.dart';
import 'login_page.dart';

class ListJadwalPage extends StatefulWidget {
  @override
  _ListJadwalPageState createState() => _ListJadwalPageState();
}

class _ListJadwalPageState extends State<ListJadwalPage> {
  int _selectedIndex = 1; // Indeks awal di navbar (List Jadwal Page)
  String? selectedDate; // Track selected date

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Ubah indeks yang dipilih
    });

    // Navigasi berdasarkan indeks
    if (index == 0) {
      // Navigasi ke DashboardPage
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => DashboardPage()),
      );
    } else if (index == 2) {
      // Tampilkan notifikasi
      _showNotificationDialog(context);
    } else if (index == 3) {
      // Buka pencarian
      showSearch(
        context: context,
        delegate: CustomSearchDelegate(),
      );
    }
  }

  void _onDateSelected(String date) {
    setState(() {
      selectedDate = date; // Update the selected date
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Jadwal', style: TextStyle(color: Colors.amber[50])),
        backgroundColor: Colors.red[900], // Latar belakang cream
        elevation: 0,
        actions: [
          // Profile Icon with PopupMenuButton for profile options
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'profile') {
                _showProfile(context);
              } else if (value == 'logout') {
                _logout(context);
              }
            },
            icon: Icon(Icons.account_circle, color: Colors.amber[50]),
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem<String>(
                  value: 'profile',
                  child: Row(
                    children: [
                      Icon(Icons.account_circle, color: Colors.red[900]),
                      SizedBox(width: 8),
                      Text('View Profile'),
                    ],
                  ),
                ),
                PopupMenuItem<String>(
                  value: 'logout',
                  child: Row(
                    children: [
                      Icon(Icons.exit_to_app, color: Colors.red[900]),
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Bagian Header
          Container(
            color: Colors.red[900], // Warna cream
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'November, 2024',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.amber[50], // Teks maroon
                  ),
                ),
                SizedBox(height: 16),
                // Baris tanggal
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildDateItem('17', 'Min'),
                    _buildDateItem('18', 'Sen'),
                    _buildDateItem('19', 'Sel'),
                    _buildDateItem('20', 'Rab'),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          // Daftar Tugas
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.amber[50], // Warna cream
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Daftar Tugas',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.red[900], // Teks maroon
                      ),
                    ),
                    SizedBox(height: 16),
                    // Tambahkan scroll vertikal
                    Expanded(
                      child: ListView(
                        children: [
                          _buildTaskCard(
                              'UTS Mobile Programming', '10:00 - 14:00'),
                          SizedBox(height: 8),
                          _buildTaskCard('Ngerjakan Tugas', '18:00'),
                          SizedBox(height: 8),
                          _buildTaskCard('Mencuci Baju', '06:00 - 07:00'),
                          SizedBox(height: 8),
                          _buildTaskCard('Menanam Pohon', '09.00 - 09:30'),
                          SizedBox(height: 8),
                          _buildTaskCard('Memasak', '10:00 - 12:00'),
                          SizedBox(height: 8),
                          _buildTaskCard('Belajar', '19:00 - 22.00'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.red[900], // Tombol maroon
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreateTaskPage()),
          );
        },
        icon: Icon(Icons.add, color: Colors.amber[50]), // Ikon cream
        label: Text(
          'Tugas',
          style: TextStyle(color: Colors.amber[50], fontWeight: FontWeight.bold),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.amber[50], // Latar cream
        selectedItemColor: Colors.red[900], // Item terpilih maroon
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex, // Indeks aktif
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Jadwal'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Notifikasi'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
        ],
        onTap: _onItemTapped, // Fungsi navigasi
      ),
    );
  }

  Widget _buildDateItem(String day, String weekday) {
    bool isSelected = selectedDate == day; // Check if the date is selected
    return GestureDetector(
      onTap: () => _onDateSelected(day), // Update selected date on tap
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: isSelected ? Colors.amber[50] : Colors.red[900],
              shape: BoxShape.circle,
            ),
            padding: EdgeInsets.all(8.0),
            child: Text(
              day,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: isSelected ? Colors.red[900] : Colors.amber[50],
              ),
            ),
          ),
          SizedBox(height: 4),
          Text(
            weekday,
            style: TextStyle(color: Colors.amber[50]), // Warna cream
          ),
        ],
      ),
    );
  }


  Widget _buildTaskCard(String title, String time) {
    return Card(
      color: Colors.amber[50], // Card cream
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 2,
      child: ListTile(
        leading: Icon(Icons.assignment, color: Colors.red[900]), // Ikon maroon
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red[900]),
        ),
        subtitle: Text(time),
        trailing: Icon(Icons.more_vert, color: Colors.red[900]), // Ikon maroon
      ),
    );
  }

  // Function to show the profile dialog
  void _showProfile(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('User Profile'),
          content: Text('Profile details can be shown here.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the profile dialog
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  // Function to handle logout and navigate to login page
  void _logout(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()), // Navigate to the login page
    );
  }

  void _showNotificationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Notifikasi'),
          content: Text('Tidak ada notifikasi baru.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Tutup'),
            ),
          ],
        );
      },
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  // List of sample tasks for search suggestions and results
  final List<String> taskList = [
    'UTS Mobile Programming',
    'Ngerjakan Tugas',
    'Mencuci Baju',
    'Menanam Pohon',
    'Memasak',
    'Belajar',
  ];

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return Center(
        child: Text('Masukkan tugas atau catatan untuk mencari.'),
      );
    } else {
      final suggestionList = taskList.where((task) {
        return task.toLowerCase().contains(query.toLowerCase());
      }).toList();

      if (suggestionList.isEmpty) {
        return Center(
          child: Text('Tidak ada hasil yang ditemukan.'),
        );
      } else {
        return ListView.builder(
          itemCount: suggestionList.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(suggestionList[index]),
              onTap: () {
                query = suggestionList[index];
                showResults(context);
              },
            );
          },
        );
      }
    }
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.isEmpty) {
      return Center(
        child: Text('Masukkan tugas atau catatan untuk mencari.'),
      );
    } else {
      final resultList = taskList.where((task) {
        return task.toLowerCase().contains(query.toLowerCase());
      }).toList();

      if (resultList.isEmpty) {
        return Center(
          child: Text('Tidak ada hasil yang ditemukan.'),
        );
      } else {
        return ListView.builder(
          itemCount: resultList.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(resultList[index]),
            );
          },
        );
      }
    }
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }
}
