
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class NotificationItem extends StatelessWidget {
  final int index;

  const NotificationItem({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.notifications, color: Theme.of(context).iconTheme.color),
      title: Text(
        'Notification ${index + 1}',
        style: GoogleFonts.lato(
          color: Theme.of(context).textTheme.bodyLarge!.color,
        ),
      ),
      subtitle: Text(
        'This is the detail of notification ${index + 1}',
        style: GoogleFonts.lato(
          color: Theme.of(context).textTheme.bodyMedium!.color,
        ),
      ),
    );
  }
}