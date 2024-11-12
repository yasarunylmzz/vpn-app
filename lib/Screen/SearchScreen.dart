import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<String> allItems = ['Apple', 'Banana', 'Cherry', 'Date', 'Fig', 'Grape'];
  List<String> filteredItems = [];
  String query = '';

  @override
  void initState() {
    super.initState();
    filteredItems = allItems;
  }

  void updateSearchQuery(String newQuery) {
    setState(() {
      query = newQuery;
      filteredItems = allItems
          .where((item) => item.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          onChanged: updateSearchQuery,
          decoration: const InputDecoration(
            hintText: 'Search...',
            border: InputBorder.none,
            suffixIcon: Icon(Icons.search),
          ),
          style: GoogleFonts.sora(
              color: Colors.black, fontWeight: FontWeight.bold),
          cursorColor: Colors.white,
        ),
        backgroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: filteredItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(filteredItems[index]),
          );
        },
      ),
    );
  }
}
