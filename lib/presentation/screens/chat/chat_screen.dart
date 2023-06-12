import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yesnoo/domain/entities/message.dart';
import 'package:yesnoo/presentation/providers/chat_provider.dart';
import 'package:yesnoo/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yesnoo/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yesnoo/presentation/widgets/shared/message_field_box.dart';


class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
        leading: const Padding(
          padding:  EdgeInsets.all(4.0),
          child:  CircleAvatar(
            backgroundImage: NetworkImage('https://styles.redditmedia.com/t5_2jgkd4/styles/communityIcon_r3t4ul2r2nwa1.jpg?width=256&s=31b717872e94197ca853c0659ea736f94092ef17'),
          ),
        ),
        title: const Text('Mi amor <3'),
        centerTitle: false,
      ),
    body: _ChatView(), 
    );
  }
}

class _ChatView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric( horizontal: 10 ),
        child: Column(
          children: [
            Expanded (
              child: ListView.builder(
                controller: chatProvider.chatScrollController,
                itemCount: chatProvider.messageList.length,
                itemBuilder: (context, index){
                  final message = chatProvider.messageList[index];
                  return (message.fromWho==FromWho.hers) 
                    ? const HerMessageBubble()
                    : MyMessageBubble(message: message,);  
                }),
              ),
            
             MessageFieldBox(
              onValue: chatProvider.sendMessage),
              // onValue: (value)=>chatProvider.sendMessage(value)),
            
          ],
        ),
      )
    );
  }
}