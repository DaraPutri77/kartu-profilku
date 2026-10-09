
import 'package:flutter/material.dart';

void main() {
  runApp(const KartuProfilApp());
}

const warnaUtama = Color(0xFF2457A7);
const warnaLatar = Color(0xFFF1F6FF);
const warnaTeks = Color(0xFF172B4D);

class KartuProfilApp extends StatelessWidget {
  const KartuProfilApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kartu Profil',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: warnaUtama,
        ),
        scaffoldBackgroundColor: warnaLatar,
      ),
      home: const HalamanProfil(),
    );
  }
}

class HalamanProfil extends StatelessWidget {
  const HalamanProfil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Kartu Profil',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: warnaTeks,
          ),
        ),
        centerTitle: true,
        backgroundColor: warnaLatar,
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, ukuran) {
            final bool layarLebar = ukuran.maxWidth > 600;

            return SingleChildScrollView(
              padding: EdgeInsets.all(layarLebar ? 24 : 16),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 900,
                  ),
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(
                      layarLebar ? 24 : 18,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(28),
                      border: Border.all(
                        color: const Color(0xFFD8E5FA),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: warnaUtama.withAlpha(20),
                          blurRadius: 25,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: layarLebar
                        ? Row(
                      crossAxisAlignment:
                      CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 4,
                          child: fotoProfil(),
                        ),
                        const SizedBox(width: 28),
                        const Expanded(
                          flex: 6,
                          child: InformasiProfil(),
                        ),
                      ],
                    )
                        : Column(
                      children: [
                        fotoProfil(),
                        const SizedBox(height: 24),
                        const InformasiProfil(
                          rataTengah: true,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget fotoProfil() {
    return Center(
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFF3982F6),
                width: 3,
              ),
            ),
            child: const CircleAvatar(
              radius: 85,
              backgroundColor: Color(0xFFDCE7F7),
              backgroundImage: AssetImage(
                'assets/foto_profil.jpg',
              ),
            ),
          ),
          Positioned(
            bottom: 8,
            right: -12,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 8,
              ),
              decoration: BoxDecoration(
                color: const Color(0xFF159B63),
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  color: Colors.white,
                  width: 3,
                ),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.circle,
                    size: 9,
                    color: Colors.white,
                  ),
                  SizedBox(width: 5),
                  Text(
                    'Available',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class InformasiProfil extends StatelessWidget {
  final bool rataTengah;

  const InformasiProfil({
    super.key,
    this.rataTengah = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: rataTengah
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        Text(
          'Dara Putri',
          textAlign: rataTengah
              ? TextAlign.center
              : TextAlign.start,
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: warnaTeks,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          'Mahasiswa Sistem Informasi',
          textAlign: rataTengah
              ? TextAlign.center
              : TextAlign.start,
          style: const TextStyle(
            fontSize: 15,
            color: Color(0xFF526B91),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Saya adalah mahasiswa Sistem Informasi '
              'yang tertarik pada pengembangan aplikasi, '
              'desain antarmuka, dan teknologi informasi.',
          textAlign: rataTengah
              ? TextAlign.center
              : TextAlign.start,
          style: const TextStyle(
            fontSize: 14,
            height: 1.8,
            color: Color(0xFF405575),
          ),
        ),
        const SizedBox(height: 24),
        const LabelBagian(
          ikon: Icons.stars_rounded,
          judul: 'Keahlian',
        ),
        const SizedBox(height: 10),
        Wrap(
          alignment: WrapAlignment.start,
          spacing: 8,
          runSpacing: 4,
          children: const [
            ChipKeahlian(
              ikon: Icons.phone_android,
              teks: 'Flutter',
            ),
            ChipKeahlian(
              ikon: Icons.palette_outlined,
              teks: 'UI/UX',
            ),
            ChipKeahlian(
              ikon: Icons.storage_rounded,
              teks: 'Database',
            ),
            ChipKeahlian(
              ikon: Icons.code_rounded,
              teks: 'Programming',
            ),
          ],
        ),
        const SizedBox(height: 20),
        const Divider(
          color: Color(0xFFE1E9F5),
        ),
        const SizedBox(height: 14),
        const LabelBagian(
          ikon: Icons.person_outline,
          judul: 'Kontak',
        ),
        const SizedBox(height: 16),
        const Row(
          children: [
            Expanded(
              child: IkonKontak(
                ikon: Icons.email_rounded,
                label: 'Email',
                warna: Color(0xFF3982F6),
              ),
            ),
            Expanded(
              child: IkonKontak(
                ikon: Icons.phone_rounded,
                label: 'Telepon',
                warna: Color(0xFF159B63),
              ),
            ),
            Expanded(
              child: IkonKontak(
                ikon: Icons.code_rounded,
                label: 'GitHub',
                warna: Color(0xFF26364D),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class LabelBagian extends StatelessWidget {
  final IconData ikon;
  final String judul;

  const LabelBagian({
    super.key,
    required this.ikon,
    required this.judul,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          ikon,
          color: warnaUtama,
          size: 23,
        ),
        const SizedBox(width: 9),
        Text(
          judul,
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: warnaTeks,
          ),
        ),
      ],
    );
  }
}

class ChipKeahlian extends StatelessWidget {
  final IconData ikon;
  final String teks;

  const ChipKeahlian({
    super.key,
    required this.ikon,
    required this.teks,
  });

  @override
  Widget build(BuildContext context) {
    return Chip(
      avatar: Icon(
        ikon,
        size: 17,
        color: warnaUtama,
      ),
      label: Text(teks),
      backgroundColor: const Color(0xFFEAF1FF),
      side: BorderSide.none,
      labelStyle: const TextStyle(
        color: warnaUtama,
        fontWeight: FontWeight.w600,
        fontSize: 12,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 3,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
    );
  }
}

class IkonKontak extends StatelessWidget {
  final IconData ikon;
  final String label;
  final Color warna;

  const IkonKontak({
    super.key,
    required this.ikon,
    required this.label,
    required this.warna,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          radius: 23,
          backgroundColor: warna,
          child: Icon(
            ikon,
            color: Colors.white,
            size: 22,
          ),
        ),
        const SizedBox(height: 7),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: warnaTeks,
          ),
        ),
      ],
    );
  }
}