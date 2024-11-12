import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconify_flutter_plus/iconify_flutter_plus.dart';
import 'package:iconify_flutter_plus/icons/material_symbols.dart';

class ServerComponent extends StatelessWidget {
  const ServerComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool isFree = false;
    return Container(
      width: 330,
      height: 55,
      decoration: BoxDecoration(
          color: isFree ? Colors.orange.shade800 : Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            isFree
                ? BoxShadow(
                    color: Colors.orange.shade800,
                    offset: const Offset(0, 2),
                    blurRadius: 6.0,
                  )
                : BoxShadow(
                    color: Colors.black26,
                    offset: const Offset(0, 2),
                    blurRadius: 6.0,
                  ),
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              // Almanya ikonunu ekliyoruz
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  'assets/germany.svg',
                  width: 40, // Gerekli boyutlandırma
                  height: 40,
                ),
              ),
              const SizedBox(width: 10), // İkon ve yazı arasında boşluk
              Text(
                'Germany',
                style: TextStyle(
                  color: isFree ? Colors.white : Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Iconify(
                  MaterialSymbols.signal_cellular_alt_rounded,
                  color: isFree ? Colors.white : Colors.black,
                  size: 24,
                ),
                Container(
                  width: 1,
                  height: 24,
                  color: isFree ? Colors.white : Colors.black,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                ),
                Iconify(
                  MaterialSymbols.arrow_forward_ios_rounded,
                  color: isFree ? Colors.white : Colors.black,
                  size: 20,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
