import 'package:flutter/material.dart';
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
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric( horizontal: 10 ),
        child: Column(
          children: [
            Expanded (
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index){
                  return (index%2 == 0 ) ?    const HerMessageBubble() :
                  const MyMessageBubble();  
                }),
              ),
            
            const MessageFieldBox(),
            
          ],
        ),
      )
    );
  }
}