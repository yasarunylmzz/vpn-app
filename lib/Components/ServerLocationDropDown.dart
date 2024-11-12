import 'package:flutter/material.dart';

class ServerLocationDropdown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Server Location',
                style: TextStyle(fontSize: 14, color: Colors.grey)),
            DropdownButton<String>(
              items: const <DropdownMenuItem<String>>[
                DropdownMenuItem<String>(
                  value: 'Germany',
                  child: Row(
                    children: [
                      Icon(Icons.flag, color: Colors.red),
                      SizedBox(width: 8),
                      Text('Germany'),
                    ],
                  ),
                ),
              ],
              onChanged: null,
              icon: const Icon(Icons.arrow_drop_down),
            ),
          ],
        ),
      ),
    );
  }
}
