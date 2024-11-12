import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white, // Arka plan rengi beyaz
            borderRadius: BorderRadius.circular(12), // Kenar yuvarlaklığı
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4,
                offset: Offset(0, 2), // Gölge konumu
              ),
            ],
          ),
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.of(context)
                  .pop(); // Geri butonuna basıldığında geri git
            },
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white, // Arka plan rengi beyaz
            borderRadius: BorderRadius.circular(12), // Kenar yuvarlaklığı
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4,
                offset: Offset(0, 2), // Gölge konumu
              ),
            ],
          ),
          child: IconButton(
            icon: const Icon(Icons.menu_book, color: Colors.black),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
