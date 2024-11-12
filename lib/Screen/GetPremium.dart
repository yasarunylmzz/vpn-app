import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Getpremium extends StatefulWidget {
  const Getpremium({super.key});

  @override
  _GetpremiumState createState() => _GetpremiumState();
}

class _GetpremiumState extends State<Getpremium> {
  String? _selectedPlan;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0, 2),
                          blurRadius: 6.0,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 26,
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                SizedBox(
                  width: 350,
                  child: Column(
                    children: [
                      Text(
                        'Get Premium',
                        style: GoogleFonts.sora(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade800,
                        ),
                      ),
                      Text('Access all servers worldwide, fast and powerful!',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.sora(
                            fontSize: 18.0,
                            color: Colors.grey.shade500,
                          )),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Choose Your Plan',
                    style: GoogleFonts.sora(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade500,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildPlanContainer('Daily', '\$0.99/daily', 'daily'),
                      _buildPlanContainer('Weekly', '\$1.99/weekly', 'weekly'),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildPlanContainer(
                          'Monthly', '\$9.99/monthly', 'monthly'),
                      _buildPlanContainer('Yearly', '\$9.99/yearly', 'yearly'),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 350,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.orange.shade800,
                      borderRadius: BorderRadius.circular(20.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.orange.shade800,
                          offset: const Offset(0, 2),
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        'Upgrade',
                        style: GoogleFonts.sora(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildPlanContainer(String title, String price, String planId) {
    bool isSelected = _selectedPlan == planId;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedPlan = planId;
        });
      },
      child: Container(
        width: 160,
        height: 95,
        decoration: BoxDecoration(
          color: isSelected ? Colors.orange.shade500 : Colors.white,
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 2),
              blurRadius: 6.0,
            ),
          ],
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: GoogleFonts.sora(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: isSelected ? Colors.white : Colors.grey.shade800,
                ),
              ),
              Text(
                price,
                style: GoogleFonts.sora(
                  fontSize: 14.0,
                  color: isSelected ? Colors.white : Colors.grey.shade500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
