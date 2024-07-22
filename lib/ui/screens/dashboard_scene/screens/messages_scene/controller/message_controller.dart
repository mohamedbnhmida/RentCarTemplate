import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessageController extends GetxController {
  var messages = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Add 10 dummy messages
    for (int i = 0; i < 10; i++) {
      messages.add('Message  $i');
    }
  }

  void addMessage(String message) {
    messages.add(message);
  }
}