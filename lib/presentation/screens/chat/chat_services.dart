import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:renttas/domain/models/user_model/model.dart';
import 'package:renttas/presentation/screens/chat/chat_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../main.dart';

class ChatService extends ChangeNotifier {
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  Future<String?> getSavedInfo() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? savedValue = preferences.getString(loginTocken); // Replace with your actual key

    return savedValue;
  }


  //send Message
  Future<void> sendMessage(String senderId, String receiverId, String message) async {
//get user info
    String? savedValue = await getSavedInfo();
    print(senderId);
  print(receiverId);
  print(message);
    final Timestamp timestamp = Timestamp.now();
    //create a msg
    Message newMessage = Message(
        senderId: senderId,
        receiverId: receiverId,
        senderType: savedValue!,
        message: message,
        timestamp: timestamp);
//construct chat room
    List<String> ids = [senderId, receiverId];
    ids.sort(); //chat id will be same for both
    String chatRoomId = ids.join('_');
//add new msg

    await _fireStore
        .collection('chat_rooms')
        .doc(chatRoomId)
        .collection('messages')
        .add(newMessage.toMap());
  }

  //get Message
  Stream<QuerySnapshot> getMessages(String userId, String otherUserId) {
    List<String> ids = [userId, otherUserId];
    ids.sort();
    String chatRoomId = ids.join('_');

    return _fireStore
        .collection('chat_rooms')
        .doc(chatRoomId)
        .collection('messages')
        .orderBy('timestamp', descending: false)
        .snapshots();
  }
}
