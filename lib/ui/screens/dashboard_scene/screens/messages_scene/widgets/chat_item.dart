import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rent_car_dashboard/data/models/chat_item.dart';
import 'package:rent_car_dashboard/utils/app_routes.dart';
import 'package:rent_car_dashboard/utils/responsive.dart';

class ChatItemWidget extends StatelessWidget {
  final ChatItem chatItem;

  ChatItemWidget({required this.chatItem});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(chatItem.avatarUrl),
      ),
      title: Text(chatItem.name,style: Theme.of(context)
                    .textTheme
                    .labelLarge!),
      subtitle: Text(chatItem.lastMessage ,style: Theme.of(context)
                    .textTheme
                    .labelMedium! ,),
      trailing: Text(chatItem.date, style: Theme.of(context)
                    .textTheme
                    .labelMedium! ,),onTap: () {
       if (Responsive.isMobile(context)) {
        Get.toNamed(AppRoutes.messages);
       } 
      },
    );
  }
}