import 'package:rent_car_dashboard/ui/screens/dashboard_scene/screens/messages_scene/controller/message_controller.dart';
import 'package:flutter/material.dart';
 
import 'package:get/get.dart';
import 'package:rent_car_dashboard/ui/screens/dashboard_scene/screens/messages_scene/pages/message_web_page.dart';
import 'package:rent_car_dashboard/ui/screens/dashboard_scene/screens/messages_scene/widgets/message_header.dart';
import 'package:rent_car_dashboard/utils/responsive.dart';

import '../widgets/message_bubble.dart';
 

class MessagePage extends StatelessWidget {
  final MessageController controller = Get.put(MessageController());
  final TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return   Expanded(
            child: Column(
              children: [
                MessageHeader(),
                Expanded(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1360),
        child:  Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        padding: const EdgeInsets.all(8.0),
        child: Column(  
          children: [
            Expanded(
              child: Obx(() => ListView.builder(
                    itemCount: controller.messages.length,
                    itemBuilder: (context, index) {
                      bool isSender = index % 2 == 0;
                      return MessageBubble(
                        message: controller.messages[index],
                        isSender: isSender,
                      );
                    },
                  )),
            ),
            _buildMessageInput(context),
          ],
        ),
      
    )
      ),
    )
              ],
            ),
          ) 
    
    
    
    
    
   ;
  }
Widget _buildMessageInput(BuildContext context) {
  return SafeArea( 
    child: Center(
      child:ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 800),
        child: Container(
        padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(15.0), // Rounded corners
        ),
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: messageController,
                  decoration: InputDecoration(
                    hintText: 'Type a message',
                    border: InputBorder.none,
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.send, color: Colors.blue),
                onPressed: () {
                  if (messageController.text.isNotEmpty) {
                    controller.addMessage(messageController.text);
                    messageController.clear();
                  }
                },
              ),
            ],
          ),
        ),
      ),)
    ),
  );
}
}
class MessageMobilePage
 extends StatelessWidget { 

  @override
  Widget build(BuildContext context) {
    return Scaffold(body:    (Responsive.isMobile(context)) ? MessagePage() : MessageWebPage());
  }
}