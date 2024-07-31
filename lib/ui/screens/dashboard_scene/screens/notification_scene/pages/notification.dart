import 'package:rent_car_dashboard/ui/screens/dashboard_scene/screens/notification_scene/widgets/notification_item.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Theme.of(context).iconTheme.color),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text('Notifications', style: GoogleFonts.lato(color: Theme.of(context).textTheme.bodyLarge!.color, fontWeight: FontWeight.bold)), 
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: List.generate(20, (index) => NotificationItem()), // Generate dummy notifications
      ),
    );
  }
}
