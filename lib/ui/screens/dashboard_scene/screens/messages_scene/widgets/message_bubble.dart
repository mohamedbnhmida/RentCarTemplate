 
import 'package:flutter/material.dart';
import 'package:rent_car_dashboard/utils/app_colors.dart';
  

class MessageBubble extends StatelessWidget {
  final String message;
  final bool isSender;

  MessageBubble({required this.message, required this.isSender});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width / 1.3,
        ),
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: isSender ?  Theme.of(context).cardColor : AppColors.primary,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(isSender ? 15 : 0),
              topRight: Radius.circular(isSender ? 0 : 15),
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
          ),
          child: Text(
            message,
            style: TextStyle(color: isSender ? Theme.of(context).textTheme.bodyLarge!.color : Colors.white),
          ),
        ),
      ),
    );
  }
}