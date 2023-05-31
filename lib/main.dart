import 'package:flutter/material.dart';
import 'package:yesnoo/config/theme/app_theme.dart';
import 'package:yesnoo/presentation/screens/chat/chat_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme(selectorColor:6).theme() ,
      home: const ChatScreen(),
    );
  }
}