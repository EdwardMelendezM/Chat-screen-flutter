import 'package:flutter/material.dart';
import 'package:yesnoo/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier{

  final ScrollController chatScrollController = ScrollController();

  List<Message> messageList = [
    Message(text: 'Hola amor', fromWho: FromWho.me),
    Message(text: 'Ya regresaste el trabajo?', fromWho: FromWho.me),
  ];

  Future<void> sendMessage(String text) async{
    if(text.isEmpty) return;
    final newMessage = Message(text: text,fromWho: FromWho.me);
    messageList.add(newMessage);
    //Llamamos a setState pero con otro nombre
    notifyListeners();
    moveScrollToBottom();
  }
  Future<void> moveScrollToBottom() async{
    await Future.delayed(const Duration(milliseconds: 100));
    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut);
  }
}