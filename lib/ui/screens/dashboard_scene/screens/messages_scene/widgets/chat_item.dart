import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rent_car_dashboard/data/models/chat_item.dart'; 
import 'package:rent_car_dashboard/utils/app_routes.dart';
import 'package:rent_car_dashboard/utils/responsive.dart';
 

class ChatItemWidget extends StatefulWidget {
  final ChatItem chatItem;

  ChatItemWidget({required this.chatItem});

  @override
  _ChatItemWidgetState createState() => _ChatItemWidgetState();
}

class _ChatItemWidgetState extends State<ChatItemWidget> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => _onHover(true),
      onExit: (event) => _onHover(false),
      child: InkWell(
        onTap: () {
          if (Responsive.isMobile(context)) {
            Get.toNamed(AppRoutes.messages);
          }
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 50),
          decoration: BoxDecoration( 
            borderRadius: BorderRadius.circular(10),
            boxShadow: _isHovered
                ? [BoxShadow(color: Theme.of(context).scaffoldBackgroundColor, blurRadius: 1)]
                : [],
          ),
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(widget.chatItem.avatarUrl),
            ),
            title: Text(
              widget.chatItem.name,
              style: Theme.of(context).textTheme.labelLarge!,
            ),
            subtitle: Text(
              widget.chatItem.lastMessage,
              style: Theme.of(context).textTheme.labelMedium!,
            ),
            trailing: Text(
              widget.chatItem.date,
              style: Theme.of(context).textTheme.labelMedium!,
            ),
          ),
        ),
      ),
    );
  }

  void _onHover(bool hovering) {
    setState(() {
      _isHovered = hovering;
    });
  }
}

class ChatItemTablet extends StatefulWidget {
  final ChatItem chatItem;

  ChatItemTablet({required this.chatItem});

  @override
  _ChatItemTabletState createState() => _ChatItemTabletState();
}

class _ChatItemTabletState extends State<ChatItemTablet> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MouseRegion(
        onEnter: (event) => _onHover(true),
        onExit: (event) => _onHover(false),
        child: InkWell(
          onTap: () {
            print('Widget tapped!');
          },
          child: AnimatedContainer(
            duration: Duration(milliseconds: 200),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: _isHovered
                  ? [BoxShadow(color: Colors.grey, blurRadius: 10)]
                  : [],
            ),
            child: CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage(widget.chatItem.avatarUrl),
            ),
          ),
        ),
      ),
    );
  }

  void _onHover(bool hovering) {
    setState(() {
      _isHovered = hovering;
    });
  }
}