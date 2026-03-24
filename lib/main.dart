import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Menghilangkan banner debug di pojok kanan
      title: 'BCA Mobile Replica',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BCAMobileHomePage(),
    );
  }
}

class BCAMobileHomePage extends StatelessWidget {
  const BCAMobileHomePage({super.key});

  // 1. Definisikan Warna Khas BCA
  final Color bcaBlue = const Color(0xFF005697);  
  final Color bcaNavy = const Color(0xFF003A6A);  
  final Color bcaGray = const Color(0xFFF0F0F0);  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bcaGray, 
      
      // 2. Bagian Atas (AppBar)
      appBar: AppBar(
        backgroundColor: bcaNavy,
        elevation: 0, 
        title: Row(
          children: const [
            Icon(Icons.account_balance, color: Colors.white, size: 28),
            SizedBox(width: 10),
            Text(
              "m-BCA", 
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22)
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {}, 
            icon: const Icon(Icons.notifications_none, color: Colors.white, size: 28)
          ),
          const SizedBox(width: 10),
        ],
      ),
      
      body: SingleChildScrollView(
        child: Column(
          children: [
            
            // 3. Header Biru (Welcome Section)
            Container(
              height: 180,
              width: double.infinity,
              color: bcaNavy,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("Selamat Datang,", style: TextStyle(color: Colors.white70)),
                  Text(
                    "Maulana Ach Dani", // Silakan ganti dengan namamu
                    style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),

            // 4. Bagian Konten dengan Stack (Untuk membuat efek kartu melayang)
            Stack(
              clipBehavior: Clip.none,
              children: [
                // Container Utama untuk Menu & Promo
                Container(
                  width: double.infinity,
                  color: bcaGray,
                  padding: const EdgeInsets.only(top: 80, left: 15, right: 15),
                  child: Column(
                    children: [
                      
                      // 5. Grid Menu (8 Icon)
                      GridView.count(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: 4,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 10,
                        children: [
                          _buildMenuItem(Icons.info_outline, "m-Info"),
                          _buildMenuItem(Icons.send_outlined, "m-Transfer"),
                          _buildMenuItem(Icons.payment_outlined, "m-Payment"),
                          _buildMenuItem(Icons.shopping_cart_outlined, "m-Commerce"),
                          _buildMenuItem(Icons.qr_code_scanner_outlined, "QRIS"),
                          _buildMenuItem(Icons.account_balance_wallet_outlined, "BCA Keyboard"),
                          _buildMenuItem(Icons.phone_android_outlined, "Flazz"),
                          _buildMenuItem(Icons.add_circle_outline, "Buka Rekening"),
                        ],
                      ),
                      
                      const SizedBox(height: 30),
                      
                      // 6. Bagian Promo
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Promo & Penawaran", 
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87)
                        ),
                      ),
                      const SizedBox(height: 15),
                      _buildPromoCard("Makin Hemat pakai QRIS BCA", "Cashback hingga 50% di merchant pilihan."),
                      _buildPromoCard("Beli Pulsa & Paket Data", "Bonus kuota melimpah."),
                    ],
                  ),
                ),

                // 7. Kartu Saldo (Positioned agar melayang di atas Stack)
                Positioned(
                  top: -60, 
                  left: 20,
                  right: 20,
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(color: Colors.black12, blurRadius: 10, offset: const Offset(0, 5)),
                      ],
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Tabungan Anda", style: TextStyle(color: Colors.black54)),
                            Icon(Icons.more_vert, color: bcaNavy),
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "Rp 10.500.000,00", 
                          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black)
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // --- Fungsi Helper (Supaya Kode Lebih Rapi) ---

  // Fungsi untuk membuat item menu icon bulat
  Widget _buildMenuItem(IconData iconData, String title) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle, 
            border: Border.all(color: Colors.blue[100]!),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 5, offset: const Offset(0, 2)),
            ],
          ),
          child: Icon(iconData, color: bcaBlue, size: 28),
        ),
        const SizedBox(height: 8),
        Text(
          title, 
          style: const TextStyle(fontSize: 11, color: Colors.black87, fontWeight: FontWeight.w500), 
          textAlign: TextAlign.center
        ),
      ],
    );
  }

  // Fungsi untuk membuat kartu promo di bagian bawah
  Widget _buildPromoCard(String title, String subtitle) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 5, offset: const Offset(0, 2)),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(color: bcaBlue.withOpacity(0.1), borderRadius: BorderRadius.circular(10)),
            child: Icon(Icons.campaign_outlined, color: bcaBlue, size: 30),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black87)),
                Text(subtitle, style: const TextStyle(fontSize: 12, color: Colors.black54)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}