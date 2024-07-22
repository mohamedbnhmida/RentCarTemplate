
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: Icon(Icons.notifications, color: Colors.grey),
        title: Text(
          'Notification Title',
          style: GoogleFonts.lato(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          'This is a sample notification message.',
          style: GoogleFonts.lato(fontSize: 14),
        ),
        trailing: Text(
          '12/07/2024',
          style: GoogleFonts.lato(fontSize: 12, color: Colors.grey),
        ),
      ),
    );
  }
}