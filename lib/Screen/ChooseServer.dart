// ignore: file_names
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vpn_app/Components/ServerComponent.dart';
import 'package:vpn_app/Screen/SearchScreen.dart';

class ChooseServer extends StatelessWidget {
  const ChooseServer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Choose Server',
          style: GoogleFonts.sora(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(_createPageRoute());
              },
              child: Container(
                width: 350,
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0, 2),
                      blurRadius: 6.0,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Search Location',
                        style: GoogleFonts.sora(
                          color: Colors.grey,
                          fontSize: 18.0,
                        )),
                    const Icon(Icons.search, color: Colors.grey),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          Flexible(
            flex: 1, // Bu bölümün esnekliğini ayarla
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 24.0),
                  child: Text(
                    'Free Locations',
                    style: GoogleFonts.sora(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey.shade800,
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return const ListTile(
                        title: ServerComponent(),
                      );
                    },
                  ),
                ),
              ],
            ),
          ), // Free Locations ve Premium Locations arasında boşluk
          Flexible(
            flex: 1, // Bu bölümün esnekliğini ayarla
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 24.0),
                  child: Text(
                    'Premium Locations',
                    style: GoogleFonts.sora(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey.shade800,
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return const ListTile(
                        title: ServerComponent(),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  PageRouteBuilder _createPageRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => SearchScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const offsetBegin = Offset(1.0, 0.0);
        const offsetEnd = Offset.zero;
        const curve = Curves.easeInOut;

        var tween = Tween(begin: offsetBegin, end: offsetEnd)
            .chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(position: offsetAnimation, child: child);
      },
    );
  }
}
