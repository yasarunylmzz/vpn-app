import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter_plus/iconify_flutter_plus.dart';
import 'package:iconify_flutter_plus/icons/akar_icons.dart';
import 'package:vpn_app/Screen/ChooseServer.dart';
import 'package:vpn_app/Screen/GetPremium.dart';
import 'package:vpn_app/Screen/SettingsScreen.dart';
import 'package:vpn_app/VPNFunc.dart';

class Maindefault extends StatefulWidget {
  Maindefault({super.key});

  @override
  _MaindefaultState createState() => _MaindefaultState();
}

class _MaindefaultState extends State<Maindefault> {
  late VPNService vpnService;
  bool isConnected = false;
  String downloadSpeed = "0.00";
  String uploadSpeed = "0.00";
  String connectionStatus = "Not Connected";
  String duration = "00:00:00"; // Bağlantı süresi

  @override
  void initState() {
    super.initState();

    // VPNService nesnesini başlatıyoruz ve durumları dinliyoruz
    vpnService = VPNService(
      onStatusChanged: (connected) {
        setState(() {
          isConnected = connected;
          connectionStatus = connected ? "Connected" : "Not Connected";
          if (!connected) {
            resetValues(); // Bağlantı kesildiğinde tüm değerleri sıfırla
          }
        });
      },
      onStatusUpdated: (status) {
        // VPN Status verilerini güncellerken
        setState(() {
          duration = status['duration'] ?? "00:00:00";
          downloadSpeed = formatDataSize(double.parse(status['byte_in']));
          uploadSpeed = formatDataSize(double.parse(status['byte_out']));
        });
      },
    );
  }

  // Tüm değerleri sıfırlayan fonksiyon
  void resetValues() {
    downloadSpeed = "0.00";
    uploadSpeed = "0.00";
    duration = "00:00:00";
    connectionStatus = "Not Connected";
  }

  // Data boyutunu uygun birime dönüştürme fonksiyonu
  String formatDataSize(double bytes) {
    if (bytes >= 1024 * 1024 * 1024) {
      return (bytes / (1024 * 1024 * 1024)).toStringAsFixed(2) + " GB/s";
    } else if (bytes >= 1024 * 1024) {
      return (bytes / (1024 * 1024)).toStringAsFixed(2) + " MB/s";
    } else if (bytes >= 1024) {
      return (bytes / 1024).toStringAsFixed(2) + " KB/s";
    } else {
      return bytes.toStringAsFixed(2) + " B/s";
    }
  }

  void toggleVPN() {
    if (isConnected) {
      vpnService.disconnect();
      setState(() {
        resetValues(); // Bağlantı kesildiğinde tüm değerleri sıfırla
        isConnected = false; // Durum güncelleniyor
      });
    } else {
      vpnService.connect();
      setState(() {
        connectionStatus = "Connecting..."; // Bağlanırken bilgi ver
        isConnected =
            true; // Butonu güncellemek için bağlantı durumunu güncelle
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const Settingsscreen(),
                        ),
                      );
                    },
                    child: Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(0, 2),
                            color: Colors.grey,
                            blurRadius: 4.0,
                            blurStyle: BlurStyle.normal,
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.menu,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  GestureDetector(
                    child: Container(
                      width: 175,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.orange.shade800,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(0, 2),
                            color: Colors.orange.shade800,
                            blurRadius: 5.0,
                            blurStyle: BlurStyle.normal,
                          ),
                        ],
                      ),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Getpremium()),
                          );
                        },
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Iconify(
                                AkarIcons.crown,
                                color: Colors.white,
                              ),
                              Text(
                                'Go Premium',
                                style: GoogleFonts.sora(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                width: 380,
                height: 120,
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(0, 2),
                      color: Colors.grey,
                      blurRadius: 4.0,
                      blurStyle: BlurStyle.normal,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Download',
                                style: GoogleFonts.sora(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Container(
                                width: 26,
                                height: 26,
                                decoration: BoxDecoration(
                                  color: Colors.orange.shade100,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: const Icon(
                                  Icons.arrow_downward,
                                  color: Colors.orange,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                downloadSpeed,
                                style: GoogleFonts.sora(
                                  color: Colors.grey,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const VerticalDivider(
                      color: Colors.grey,
                      thickness: 0.5,
                      width: 20,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Upload',
                                style: GoogleFonts.sora(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Container(
                                width: 26,
                                height: 26,
                                decoration: BoxDecoration(
                                  color: Colors.orange.shade100,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: const Icon(
                                  Icons.arrow_upward,
                                  color: Colors.orange,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                uploadSpeed,
                                style: GoogleFonts.sora(
                                  color: Colors.grey,
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: toggleVPN, // Bağlantıyı aç/kapat
                    child: Container(
                      width: 140,
                      height: 140,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100),
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(0, 3),
                            color: Colors.grey,
                            blurRadius: 5,
                            blurStyle: BlurStyle.normal,
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            isConnected
                                ? Icons.cloud_done
                                : Icons.cloud_off_outlined,
                            color: Colors.orange.shade800,
                            size: 32,
                          ),
                          Text(
                            isConnected ? 'Stop' : 'Start',
                            style: GoogleFonts.sora(
                              color: Colors.orange.shade800,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Column(
                    children: [
                      Text(
                        connectionStatus,
                        style: GoogleFonts.sora(
                          color: Colors.black,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        duration,
                        style: GoogleFonts.sora(
                          color: Colors.grey,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ChooseServer()),
                      );
                    },
                    child: Container(
                      width: 360,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(1, 3),
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/germany.svg',
                                    height: 50,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    'Germany',
                                    style: GoogleFonts.sora(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            const Icon(
                              Icons.arrow_upward,
                              color: Colors.grey,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
