import 'package:openvpn_flutter/openvpn_flutter.dart';
import 'package:flutter/services.dart' show rootBundle;

class VPNService {
  late OpenVPN openvpn;
  bool isConnected = false;

  // Durum değişiklikleri için geri çağırma fonksiyonları
  final Function(bool isConnected)? onStatusChanged;
  final Function(Map<String, dynamic> status)? onStatusUpdated;

  VPNService({
    this.onStatusChanged,
    this.onStatusUpdated,
  }) {
    // OpenVPN nesnesini başlat ve durumu dinle
    openvpn = OpenVPN(
      onVpnStatusChanged: (status) {
        print("VPN Status: $status");
        isConnected = status != null && status.connectedOn != null;

        // Bağlantı durumu değişikliği bildirimi
        if (onStatusChanged != null) {
          onStatusChanged!(isConnected);
        }

        // Status verilerinin iletimi
        if (onStatusUpdated != null) {
          onStatusUpdated!(status?.toJson() ?? {});
        }
      },
      onVpnStageChanged: (stage, message) {
        print("VPN Stage: $stage, Message: $message");
      },
    );

    // OpenVPN'i başlat
    openvpn.initialize(
      groupIdentifier: "group.com.yourcompany.vpn", // iOS için grup identifier
      providerBundleIdentifier:
          "com.yourcompany.vpn.Provider", // iOS için paket id
      localizedDescription: "My VPN", // iOS için açıklama
    );
  }

  // VPN Bağlantısını Başlatan Fonksiyon
  Future<void> connect() async {
    String config = await rootBundle.loadString('assets/yasar.ovpn');
    openvpn.connect(
      config,
      'VPN Connection',
      username: 'YOUR_USERNAME',
      password: 'YOUR_PASSWORD',
      bypassPackages: [],
      certIsRequired: false,
    );
  }

  // VPN Bağlantısını Sonlandıran Fonksiyon
  void disconnect() {
    openvpn.disconnect();
  }
}
