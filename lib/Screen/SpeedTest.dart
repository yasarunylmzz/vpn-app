import 'package:flutter/material.dart';
import 'package:vpn_app/Components/CustomAppBar.dart';
import 'package:vpn_app/Components/ServerLocationDropDown.dart';
import 'package:vpn_app/Components/SpeedGauge.dart';
import 'package:vpn_app/Components/SpeedInfoCard.dart';
import 'package:vpn_app/Components/StartTestButton.dart';

class Speedtest extends StatelessWidget {
  const Speedtest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              CustomAppBar(),
              const SizedBox(height: 16),
              SpeedInfoCard(),
              const SizedBox(height: 32),
              SpeedGauge(
                speed: 40,
              ),
              const Spacer(),
              ServerLocationDropdown(),
              const SizedBox(height: 16),
              StartTestButton(),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
