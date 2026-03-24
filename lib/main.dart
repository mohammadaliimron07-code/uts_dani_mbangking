import 'package:flutter/material.dart';

void main() {
  runApp(const AplikasiBCA());
}

class AplikasiBCA extends StatelessWidget {
  const AplikasiBCA({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'm-BCA Pro',
      theme: ThemeData(
        fontFamily: 'sans-serif', 
        primaryColor: const Color(0xFF003A6A),
      ),
      home: const HalamanUtama(),
    );
  }
}

class HalamanUtama extends StatelessWidget {
  const HalamanUtama({super.key});

  // Konstanta Warna Elegan
  static const Color biruTua = Color(0xFF003A6A);
  static const Color biruBca = Color(0xFF005697);
  static const Color abuLatar = Color(0xFFF8F9FA); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: abuLatar,
      appBar: AppBar(
        backgroundColor: biruTua,
        elevation: 0,
        title: Row(
          children: const [
            Icon(Icons.shield_outlined, color: Colors.white, size: 24),
            SizedBox(width: 12),
            Text(
              "m-BCA",
              style: TextStyle(
                color: Colors.white, 
                fontWeight: FontWeight.w600, 
                letterSpacing: 1.5 
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.help_outline, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            
            Container(
              height: 160,
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [biruTua, biruBca],
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("Selamat Siang,", style: TextStyle(color: Colors.white70, fontSize: 14)),
                  SizedBox(height: 4),
                  Text(
                    "MAULANA ACH DANI", 
                    style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),

            
            Stack(
              clipBehavior: Clip.none,
              children: [

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(top: 85, left: 20, right: 20),
                  child: Column(
                    children: [
              
                      GridView.count(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: 4,
                        mainAxisSpacing: 25,
                        crossAxisSpacing: 10,
                        children: const [
                          MenuUtama(ikon: Icons.info_outline, label: "m-Info"),
                          MenuUtama(ikon: Icons.swap_horiz_outlined, label: "m-Transfer"),
                          MenuUtama(ikon: Icons.receipt_long_outlined, label: "m-Payment"),
                          MenuUtama(ikon: Icons.shopping_bag_outlined, label: "m-Commerce"),
                          MenuUtama(ikon: Icons.qr_code_scanner, label: "QRIS"),
                          MenuUtama(ikon: Icons.keyboard_alt_outlined, label: "Keyboard"),
                          MenuUtama(ikon: Icons.credit_card_outlined, label: "Flazz"),
                          MenuUtama(ikon: Icons.person_add_alt_1_outlined, label: "Buka Akun"),
                        ],
                      ),
                      const SizedBox(height: 35),
                      _sectionTitle("Promo Spesial"),
                      const SizedBox(height: 15),
                      _buildPromoItem("Reward BCA", "Tukar poin dengan diskon menarik."),
                      _buildPromoItem("Investasi", "Mulai masa depan dengan Welma."),
                    ],
                  ),
                ),


                Positioned(
                  top: -50,
                  left: 20,
                  right: 20,
                  child: Container(
                    padding: const EdgeInsets.all(22),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.06),
                          blurRadius: 25,
                          spreadRadius: 2,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Total Saldo", style: TextStyle(color: Colors.grey, fontSize: 13)),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              "Rp 12.750.000",
                              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: biruTua),
                            ),
                            Icon(Icons.visibility_outlined, color: Colors.grey, size: 20),
                          ],
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

  
  Widget _sectionTitle(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
      ),
    );
  }

  Widget _buildPromoItem(String t, String st) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: Row(
        children: [
          CircleAvatar(backgroundColor: biruBca.withOpacity(0.1), child: const Icon(Icons.star_outline, color: biruBca)),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(t, style: const TextStyle(fontWeight: FontWeight.bold)),
              Text(st, style: const TextStyle(color: Colors.grey, fontSize: 12)),
            ],
          )
        ],
      ),
    );
  }
}

class MenuUtama extends StatelessWidget {
  final IconData ikon;
  final String label;

  const MenuUtama({super.key, required this.ikon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.blue.shade50, width: 2),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 10, offset: const Offset(0, 4)),
            ],
          ),
          child: Icon(ikon, color: const Color(0xFF005697), size: 28),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Colors.black54),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}