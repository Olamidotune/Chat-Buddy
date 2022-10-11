import 'package:chatbuddy/screens/chat_screen.dart';
import 'package:chatbuddy/screens/signin_screen.dart';
import 'package:chatbuddy/screens/signup_screen.dart';
import 'package:chatbuddy/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          title: 'Chat Buddy',
          theme: ThemeData.dark(),
          home: const WelcomeScreen(),
          initialRoute: WelcomeScreen.routeName,
          routes: {
            WelcomeScreen.routeName: (context) => const WelcomeScreen(),
            SignInScreen.routeName: (context) => const SignInScreen(),
            SignUpScreen.routeName: (context) => const SignUpScreen(),
            ChatScreen.routeName: (context) => const ChatScreen(),
          },
        );
      },
    );
  }
}
