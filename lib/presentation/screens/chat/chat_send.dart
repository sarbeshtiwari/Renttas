import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;
import 'package:renttas/core/api/apis.dart';

class MessageChat extends GetxController {
   var isLoading = false.obs;
  Future<void> sendMessage(String text) async {
    try {
      final response = await http.post(
        Uri.parse(Api.saveChat),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          "receiverId": "1",
          "receiverRole": "landlord",
          "userId": "1",
          "userRole": "tenant",
          "content": text
        }),
      );

      if (response.statusCode == 200) {
        // Simulate receiving a response after a delay
        await Future.delayed(const Duration(seconds: 1));

        // Process the response message (simulate for demo)
        final responseBody = jsonDecode(response.body);

        // Safely access the response field
        String responseMessage = responseBody['response'];

        // setState(() {
        //   messages.insert(
        //       0, Message(text: responseMessage, isCurrentUser: false));
        // });
      } else {
        print('Failed to send message. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error sending message: $e');
    }
  }
}
  
  // void sendMessage1(String text) async {

  //   // Add the message to the message list
  //   setState(() {
  //     messages.insert(0, Message(text: text, isCurrentUser: true));
  //   });

  //   // Clear the text field
  //   textController.clear();

  //   // Send message to API
  //   try {
  //     final response = await http.post(
  //       Uri.parse(Api.saveChat),
  //       headers: {
  //         'Content-Type': 'application/json',
  //       },
  //       body: jsonEncode({
  //         "receiverId": "1",
  //         "receiverRole": "landlord",
  //         "userId": "1",
  //         "userRole": "tenant",
  //         "content": text
  //       }),
  //     );

  //     if (response.statusCode == 200) {
  //       // Simulate receiving a response after a delay
  //       await Future.delayed(const Duration(seconds: 1));

  //       // Process the response message (simulate for demo)
  //       final responseBody = jsonDecode(response.body);

  //       // Safely access the response field
  //       String responseMessage = responseBody['response'];

  //       setState(() {
  //         messages.insert(
  //             0, Message(text: responseMessage, isCurrentUser: false));
  //       });
  //     } else {
  //       print('Failed to send message. Status code: ${response.statusCode}');
  //     }
  //   } catch (e) {
  //     print('Error sending message: $e');
  //   }
  // }