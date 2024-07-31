
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card( 
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: Icon(Icons.notifications,  color: Theme.of(context).iconTheme.color),
        title: Text(
          'Notification Title',
          style: GoogleFonts.lato(fontSize: 16, fontWeight: FontWeight.bold,color: Theme.of(context).textTheme.bodyLarge!.color),
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
      color: Theme.of(context).cardColor,
    );
  }
}