import 'package:flutter/material.dart';
import 'package:yesnoo/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier{
  List<Message> messageList = [
    Message(text: 'Hola amor', fromWho: FromWho.me),
    Message(text: 'Ya regresaste el trabajo?', fromWho: FromWho.me),
  ];

  Future<void> sendMessage(String text) async{
    //Todo implementar metodo
  }
}