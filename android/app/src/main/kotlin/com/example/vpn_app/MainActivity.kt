package com.example.vpn_app

import android.content.Intent
import android.app.Activity
import io.flutter.embedding.android.FlutterActivity
import id.laskarmedia.openvpn_flutter.OpenVPNFlutterPlugin

class MainActivity : FlutterActivity() {

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        // VPN bağlantısı için izni kontrol edin
        if (requestCode == 24 && resultCode == Activity.RESULT_OK) {
            OpenVPNFlutterPlugin.connectWhileGranted(true)
        }
        super.onActivityResult(requestCode, resultCode, data)
    }
}
