import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kuis UI/UX Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        brightness: Brightness.light,
        scaffoldBackgroundColor: Color(0xFFF5F7FA),
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.deepPurple,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Color(0xFF121212),
      ),
      themeMode: ThemeMode.system,
      home: MainMenu(),
    );
  }
}

class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF667eea), Color(0xFF764ba2)],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Kuis UI/UX',
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 1.2,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Flutter Design Showcase',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white70,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: ListView(
                    padding: EdgeInsets.all(20),
                    children: [
                      SizedBox(height: 10),
                      PremiumMenuCard(
                        title: 'Grid Produk',
                        subtitle: 'Katalog produk dengan grid layout',
                        icon: Icons.shopping_bag_outlined,
                        gradientColors: [Color(0xFFFF6B6B), Color(0xFFFFE66D)],
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (c) => GridProdukPage())),
                      ),
                      PremiumMenuCard(
                        title: 'Profil Mahasiswa',
                        subtitle: 'Card profil dengan informasi lengkap',
                        icon: Icons.person_outline,
                        gradientColors: [Color(0xFF4E54C8), Color(0xFF8F94FB)],
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (c) => ProfilMahasiswaPage())),
                      ),
                      PremiumMenuCard(
                        title: 'Daftar Kontak',
                        subtitle: 'List kontak dengan status real-time',
                        icon: Icons.contacts_outlined,
                        gradientColors: [Color(0xFF38EF7D), Color(0xFF11998E)],
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (c) => DaftarKontakPage())),
                      ),
                      PremiumMenuCard(
                        title: 'Dashboard',
                        subtitle: 'Kombinasi semua widget premium',
                        icon: Icons.dashboard_outlined,
                        gradientColors: [Color(0xFFDA22FF), Color(0xFF9733EE)],
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (c) => DashboardPage())),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PremiumMenuCard extends StatefulWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final List<Color> gradientColors;
  final VoidCallback onTap;

  PremiumMenuCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.gradientColors,
    required this.onTap,
  });

  @override
  _PremiumMenuCardState createState() => _PremiumMenuCardState();
}

class _PremiumMenuCardState extends State<PremiumMenuCard> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) {
        setState(() => _isPressed = false);
        widget.onTap();
      },
      onTapCancel: () => setState(() => _isPressed = false),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 150),
        transform: Matrix4.identity()..scale(_isPressed ? 0.95 : 1.0),
        margin: EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: widget.gradientColors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: widget.gradientColors[0].withOpacity(0.3),
              blurRadius: 20,
              offset: Offset(0, 10),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: widget.onTap,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Icon(widget.icon, color: Colors.white, size: 32),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          widget.subtitle,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white.withOpacity(0.9),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios, color: Colors.white, size: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class GridProdukPage extends StatelessWidget {
  final List<Map<String, dynamic>> produkList = [
    {'nama': 'Laptop Gaming', 'harga': 'Rp 15.000.000', 'icon': Icons.laptop_mac, 'color': Color(0xFF6C5CE7)},
    {'nama': 'Smartphone', 'harga': 'Rp 5.000.000', 'icon': Icons.phone_iphone, 'color': Color(0xFFFF6B6B)},
    {'nama': 'Headphone', 'harga': 'Rp 500.000', 'icon': Icons.headphones, 'color': Color(0xFF00D2FF)},
    {'nama': 'Keyboard', 'harga': 'Rp 750.000', 'icon': Icons.keyboard, 'color': Color(0xFFFEA47F)},
    {'nama': 'Mouse Gaming', 'harga': 'Rp 300.000', 'icon': Icons.mouse, 'color': Color(0xFF55EFC4)},
    {'nama': 'Monitor 4K', 'harga': 'Rp 4.500.000', 'icon': Icons.desktop_windows, 'color': Color(0xFFA29BFE)},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF667eea), Theme.of(context).scaffoldBackgroundColor],
            stops: [0.0, 0.3],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                    SizedBox(width: 8),
                    Text('Katalog Produk', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
                  ],
                ),
              ),
              Expanded(
                child: GridView.builder(
                  padding: EdgeInsets.all(16),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.75,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemCount: produkList.length,
                  itemBuilder: (context, index) {
                    return PremiumProdukCard(
                      nama: produkList[index]['nama'],
                      harga: produkList[index]['harga'],
                      icon: produkList[index]['icon'],
                      color: produkList[index]['color'],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PremiumProdukCard extends StatefulWidget {
  final String nama;
  final String harga;
  final IconData icon;
  final Color color;

  PremiumProdukCard({required this.nama, required this.harga, required this.icon, required this.color});

  @override
  _PremiumProdukCardState createState() => _PremiumProdukCardState();
}

class _PremiumProdukCardState extends State<PremiumProdukCard> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) {
        setState(() => _isPressed = false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${widget.nama} ditambahkan ke keranjang'),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            backgroundColor: widget.color,
          ),
        );
      },
      onTapCancel: () => setState(() => _isPressed = false),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        transform: Matrix4.identity()..scale(_isPressed ? 0.95 : 1.0),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(color: widget.color.withOpacity(0.3), blurRadius: 20, offset: Offset(0, 10)),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(24),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [widget.color.withOpacity(0.2), widget.color.withOpacity(0.1)],
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Icon(widget.icon, size: 48, color: widget.color),
              ),
              SizedBox(height: 16),
              Text(
                widget.nama,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 8),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: widget.color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  widget.harga,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: widget.color),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfilMahasiswaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF4E54C8), Color(0xFF8F94FB)],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                    SizedBox(width: 8),
                    Text('Profil Mahasiswa', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
                  ],
                ),
              ),
              Expanded(
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(24),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 30, offset: Offset(0, 15)),
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(32),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: LinearGradient(colors: [Color(0xFF4E54C8), Color(0xFF8F94FB)]),
                              ),
                              child: Container(
                                padding: EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Theme.of(context).cardColor,
                                ),
                                child: CircleAvatar(
                                  radius: 60,
                                  backgroundColor: Color(0xFF4E54C8).withOpacity(0.2),
                                  child: Icon(Icons.person, size: 60, color: Color(0xFF4E54C8)),
                                ),
                              ),
                            ),
                            SizedBox(height: 24),
                            Text('Ahmad Fauzi', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                            SizedBox(height: 12),
                            InfoChip(icon: Icons.badge, label: 'NIM: 2024001234', color: Color(0xFF4E54C8)),
                            SizedBox(height: 8),
                            InfoChip(icon: Icons.school, label: 'Teknik Informatika', color: Color(0xFF8F94FB)),
                            SizedBox(height: 8),
                            InfoChip(icon: Icons.grade, label: 'IPK: 3.85', color: Color(0xFFFFD93D)),
                            SizedBox(height: 24),
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [Color(0xFF4E54C8), Color(0xFF8F94FB)]),
                                borderRadius: BorderRadius.circular(16),
                                boxShadow: [
                                  BoxShadow(color: Color(0xFF4E54C8).withOpacity(0.5), blurRadius: 20, offset: Offset(0, 10)),
                                ],
                              ),
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(16),
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) => Dialog(
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                        child: Padding(
                                          padding: EdgeInsets.all(24),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Icon(Icons.info_outline, size: 64, color: Color(0xFF4E54C8)),
                                              SizedBox(height: 16),
                                              Text('Detail Mahasiswa', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                                              SizedBox(height: 12),
                                              Text(
                                                'Menampilkan informasi lengkap mahasiswa termasuk riwayat akademik, prestasi, dan aktivitas kampus.',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(fontSize: 14),
                                              ),
                                              SizedBox(height: 24),
                                              ElevatedButton(
                                                onPressed: () => Navigator.pop(context),
                                                child: Text('Tutup'),
                                                style: ElevatedButton.styleFrom(
                                                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(vertical: 16),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.visibility, color: Colors.white),
                                        SizedBox(width: 8),
                                        Text('Lihat Detail Lengkap', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InfoChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;

  InfoChip({required this.icon, required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color, size: 20),
          SizedBox(width: 8),
          Text(label, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: color)),
        ],
      ),
    );
  }
}

class DaftarKontakPage extends StatelessWidget {
  final List<Map<String, dynamic>> kontakList = [
    {'nama': 'Budi Santoso', 'nomor': '081234567890', 'status': 'Online'},
    {'nama': 'Siti Nurhaliza', 'nomor': '081345678901', 'status': 'Offline'},
    {'nama': 'Rudi Hartono', 'nomor': '081456789012', 'status': 'Away'},
    {'nama': 'Dewi Lestari', 'nomor': '081567890123', 'status': 'Online'},
    {'nama': 'Andi Wijaya', 'nomor': '081678901234', 'status': 'Offline'},
    {'nama': 'Maya Putri', 'nomor': '081789012345', 'status': 'Online'},
  ];

  Color getStatusColor(String status) {
    switch (status) {
      case 'Online':
        return Color(0xFF00D9A3);
      case 'Away':
        return Color(0xFFFFB800);
      default:
        return Color(0xFF9E9E9E);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF38EF7D), Theme.of(context).scaffoldBackgroundColor],
            stops: [0.0, 0.3],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                    SizedBox(width: 8),
                    Text('Daftar Kontak', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
                    Spacer(),
                    IconButton(icon: Icon(Icons.search, color: Colors.white), onPressed: () {}),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.all(16),
                  itemCount: kontakList.length,
                  itemBuilder: (context, index) {
                    var kontak = kontakList[index];
                    return PremiumKontakCard(
                      nama: kontak['nama'],
                      nomor: kontak['nomor'],
                      status: kontak['status'],
                      statusColor: getStatusColor(kontak['status']),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PremiumKontakCard extends StatelessWidget {
  final String nama;
  final String nomor;
  final String status;
  final Color statusColor;

  PremiumKontakCard({required this.nama, required this.nomor, required this.status, required this.statusColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: statusColor.withOpacity(0.2), blurRadius: 15, offset: Offset(0, 5))],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () {},
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(colors: [statusColor, statusColor.withOpacity(0.5)]),
                      ),
                      child: CircleAvatar(
                        radius: 28,
                        backgroundColor: statusColor.withOpacity(0.2),
                        child: Text(
                          nama[0].toUpperCase(),
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: statusColor),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: Container(
                        width: 16,
                        height: 16,
                        decoration: BoxDecoration(
                          color: statusColor,
                          shape: BoxShape.circle,
                          border: Border.all(color: Theme.of(context).cardColor, width: 3),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(nama, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      SizedBox(height: 4),
                      Text(nomor, style: TextStyle(fontSize: 14, color: Colors.grey[600])),
                      SizedBox(height: 4),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: statusColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(status, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: statusColor)),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF00D9A3).withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: Icon(Icons.phone, color: Color(0xFF00D9A3)),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Memanggil $nama...'),
                          behavior: SnackBarBehavior.floating,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          backgroundColor: Color(0xFF00D9A3),
                        ),
                      );
                    },
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

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFDA22FF), Theme.of(context).scaffoldBackgroundColor],
            stops: [0.0, 0.3],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                    SizedBox(width: 8),
                    Text('Dashboard', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(16),
                        child: Text('Kategori', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      ),
                      Container(
                        height: 120,
                        child: GridView.count(
                          crossAxisCount: 4,
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          children: [
                            KategoriItem(icon: Icons.shopping_cart, label: 'Belanja', color: Color(0xFFFF6B6B)),
                            KategoriItem(icon: Icons.school, label: 'Edukasi', color: Color(0xFF4E54C8)),
                            KategoriItem(icon: Icons.restaurant, label: 'Kuliner', color: Color(0xFF38EF7D)),
                            KategoriItem(icon: Icons.directions_car, label: 'Transport', color: Color(0xFFFFB800)),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(16),
                        child: Text('Informasi Singkat', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [Color(0xFF667eea), Color(0xFF764ba2)]),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [BoxShadow(color: Color(0xFF667eea).withOpacity(0.3), blurRadius: 20, offset: Offset(0, 10))],
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(20),
                            child: Row(
                              children: [
                                Icon(Icons.info_outline, size: 48, color: Colors.white),
                                SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Selamat Datang!',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        'Anda memiliki 5 notifikasi baru dan 3 tugas yang harus diselesaikan hari ini.',
                                        style: TextStyle(fontSize: 14, color: Colors.white.withOpacity(0.9)),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(16),
                        child: Text('Aktivitas Terakhir', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          final icons = [Icons.shopping_bag, Icons.school, Icons.restaurant, Icons.directions_car, Icons.favorite];
                          final colors = [Color(0xFFFF6B6B), Color(0xFF4E54C8), Color(0xFF38EF7D), Color(0xFFFFB800), Color(0xFFDA22FF)];
                          final activities = ['Berbelanja Online', 'Mengerjakan Tugas', 'Pesan Makanan', 'Booking Transport', 'Wishlist Baru'];
                          
                          return Container(
                            margin: EdgeInsets.only(bottom: 12),
                            decoration: BoxDecoration(
                              color: Theme.of(context).cardColor,
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(color: colors[index].withOpacity(0.2), blurRadius: 10, offset: Offset(0, 5)),
                              ],
                            ),
                            child: ListTile(
                              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              leading: Container(
                                padding: EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: colors[index].withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Icon(icons[index], color: colors[index]),
                              ),
                              title: Text(activities[index], style: TextStyle(fontWeight: FontWeight.bold)),
                              subtitle: Text('${index + 1} hari yang lalu'),
                              trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
                            ),
                          );
                        },
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class KategoriItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;

  KategoriItem({required this.icon, required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: color.withOpacity(0.2), blurRadius: 10, offset: Offset(0, 5)),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('$label dipilih'),
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                backgroundColor: color,
              ),
            );
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, size: 28, color: color),
              ),
              SizedBox(height: 8),
              Text(
                label,
                style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}