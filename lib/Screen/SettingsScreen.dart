import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vpn_app/Screen/SpeedTest.dart';

class Settingsscreen extends StatelessWidget {
  const Settingsscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomAppBar(), // Özelleştirilmiş AppBar
              const SizedBox(height: 16),
              CircularCountdownWidget(),
              const SizedBox(height: 8),
              Text(
                'Your are secured Until',
                style: GoogleFonts.sora(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                'Oct 22nd, 2021',
                style: GoogleFonts.sora(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 32),
              // Menu kısmını sağa yaslamak için Row ve Align kullan
              Align(
                alignment: Alignment.centerRight,
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.end, // Sağ tarafa yaslamak için
                  mainAxisSize: MainAxisSize
                      .min, // Column'un genişliğini içeriğe göre ayarlamak için
                  children: [
                    MenuOption(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const Speedtest(),
                            ),
                          );
                        },
                        icon: Icons.settings,
                        title: 'Preferences',
                        caption: 'Caption'),
                    MenuOption(
                      icon: Icons.speed,
                      title: 'Speed Test',
                      caption: 'Caption',
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const Speedtest(),
                          ),
                        );
                      },
                    ),
                    MenuOption(
                      icon: Icons.card_giftcard,
                      title: 'Refer Friends',
                      caption: 'Caption',
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const Speedtest(),
                          ),
                        );
                      },
                    ),
                    MenuOption(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const Speedtest(),
                            ),
                          );
                        },
                        icon: Icons.support_agent,
                        title: 'Help & Support',
                        caption: 'Caption'),
                  ],
                ),
              ),
              const Spacer(),
              Text(
                'App version 1.2.2',
                style: GoogleFonts.sora(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white, // Arka plan rengi beyaz
            borderRadius: BorderRadius.circular(12), // Kenar yuvarlaklığı
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 4,
                offset: Offset(0, 2), // Gölge konumu
              ),
            ],
          ),
          child: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.grey.shade700),
            onPressed: () {
              Navigator.of(context)
                  .pop(); // Geri butonuna basıldığında geri git
            },
          ),
        ),
      ],
    );
  }
}

class CircularCountdownWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.orange, width: 4),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Expire',
              style: GoogleFonts.sora(
                color: Colors.grey,
              ),
            ),
            Text(
              '248',
              style: GoogleFonts.sora(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Days',
              style: GoogleFonts.sora(
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MenuOption extends StatelessWidget {
  final IconData icon;
  final String title;
  final String caption;
  final VoidCallback onTap; // Yönlendirme için bir callback fonksiyonu

  const MenuOption({
    super.key,
    required this.icon,
    required this.title,
    required this.caption,
    required this.onTap, // Yönlendirme fonksiyonunu parametre olarak al
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 90,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ListTile(
            leading: Icon(icon, color: Colors.orange),
            title: Text(
              title,
              style: GoogleFonts.sora(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              caption,
              style: GoogleFonts.sora(color: Colors.grey),
            ),
            trailing: const Icon(Icons.chevron_right),
            onTap:
                onTap, // ListTile'ın onTap özelliğine yönlendirme fonksiyonunu ata
          ),
          const Padding(
            padding: EdgeInsets.only(
                left: 72.0, right: 16.0), // Çizgiyi kısalt ve sağa yasla
            child: Divider(),
          ),
        ],
      ),
    );
  }
}
