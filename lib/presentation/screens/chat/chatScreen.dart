import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renttas/infrastructure/repository/getTenant/repo.dart';
import 'package:renttas/presentation/screens/chat/chat_bubble.dart';
import 'package:renttas/presentation/screens/chat/chat_services.dart';

import '../../../infrastructure/repository/fetchBill/repo.dart';

class ChatScreen extends StatefulWidget {

  const ChatScreen({super.key,});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final ChatService _chatService = ChatService();
  final tenant = Get.put(GetTenantRepo());
  final getbill = Get.put(FetchBillRepo());

  void sendMessage() async {
    if (_messageController.text.isNotEmpty) {
      await _chatService.sendMessage(
          receiverUserID, currentUserID, _messageController.text);
      //clear the controller
      _messageController.dispose();
    }
  }

  @override
  void initState() {
    getbill.billFetch();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat Screen'),
      ),
      body: Obx(() {
        if (getbill.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (getbill.billList.isEmpty) {
          return Center(
            child: Text('First add Tenant'),
          );
        }else {return Column(
        children: [

        Expanded(
            child: _buildMessageList(),
          ),
          _buildMessageInput(),
          SizedBox(
            height: 25,
          )
        ],
      );}}),
    );
  }

  Widget _buildMessageList() {
    return StreamBuilder(
        stream: _chatService.getMessages(
            receiverUserID, currentUserID),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Error ${snapshot.error}');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text('Loading..');
          }
          return ListView(
            children: snapshot.data!.docs
                .map((document) => _buildMessageItem(document))
                .toList(),
          );
        });
  }

  Widget _buildMessageItem(DocumentSnapshot document) {
     final tenant1 = tenant.tenantList[0];
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;

    var alignment = (data['currentUserID'] == tenant1.id)
        ? Alignment.centerRight
        : Alignment.centerLeft;

    return Container(
        alignment: alignment,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment:
                (data['currentUserID'] == tenant1.id)
                    ? CrossAxisAlignment.end
                    : CrossAxisAlignment.start,
            mainAxisAlignment:
                (data['currentUserID'] == tenant1.id)
                    ? MainAxisAlignment.end
                    : MainAxisAlignment.start,
            children: [
              Text(data['senderEmail']),
              SizedBox(
                height: 5,
              ),
              ChatBubble(message: data['message']),
            ],
          ),
        ));
  }

  Widget _buildMessageInput() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _messageController,
              obscureText: false,
            ),
          ),
          IconButton(
            onPressed: sendMessage,
            icon: Icon(
              Icons.arrow_upward_rounded,
              size: 40,
            ),
          ),
        ],
      ),
    );
  }
}











// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:renttas/core/api/apis.dart';
// import 'package:renttas/presentation/screens/chat/chat_services.dart';

// class ChatScreen extends StatefulWidget {
//   const ChatScreen({
//     Key? key,
//   }) : super(key: key);

//   @override
//   _ChatScreenState createState() => _ChatScreenState();
// }

// class _ChatScreenState extends State<ChatScreen> {
//   List<Message> messages = [];
//   TextEditingController textController = TextEditingController();
//   // final message = Get.put(MessageChat());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Contact Name'),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               reverse: true,
//               itemCount: messages.length,
//               itemBuilder: (context, index) {
//                 return ChatBubble(message: messages[index]);
//               },
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: TextField(
//                     controller: textController,
//                     onSubmitted: (text) {
//                       if (text.isNotEmpty) {
//                         // message.sendMessage(text);
//                       }
//                     },
//                   ),
//                 ),
//                 IconButton(
//                   onPressed: () {
//                     String text = textController.text.trim();
//                     if (text.isNotEmpty) {
//                       // message.sendMessage(text);
//                     }
//                   },
//                   icon: const Icon(Icons.send),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     textController.dispose();
//     super.dispose();
//   }
// }

// // class Message {
// //   final String text;
// //   final bool isCurrentUser;

// //   const Message({required this.text, required this.isCurrentUser});
// // }

// class ChatBubble extends StatelessWidget {
//   final Message message;

//   const ChatBubble({Key? key, required this.message}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Align(
//       alignment:
//           message.isCurrentUser ? Alignment.centerRight : Alignment.centerLeft,
//       child: Container(
//         padding: const EdgeInsets.all(16.0),
//         margin: const EdgeInsets.all(8.0),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(8.0),
//           color: message.isCurrentUser ? Colors.blue[100] : Colors.grey[200],
//         ),
//         child: Text(message.text),
//       ),
//     );
//   }
// }
