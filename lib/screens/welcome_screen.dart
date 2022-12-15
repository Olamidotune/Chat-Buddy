import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chatbuddy/screens/signin_screen.dart';
import 'package:chatbuddy/screens/signup_screen.dart';
import 'package:chatbuddy/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class WelcomeScreen extends StatefulWidget {
  static const String routeName = 'WelcomeScreen';
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 1,
      ),
    );

    animation = ColorTween(begin: Colors.blueGrey, end: Colors.grey.shade900)
        .animate(controller);

    controller.forward();

    controller.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    animation.isDismissed;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: AnimatedTextKit(
          animatedTexts: [
            TypewriterAnimatedText(
              'Chat Buddy',
              speed: const Duration(
                milliseconds: 120,
              ),
            ),
          ],
        ),
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 1.h,
            ),
            Hero(
              tag: 'logo',
              child: SizedBox(
                height: 60.h,
                child: Image.asset(
                  'assets/pngs/logo.png',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Button(
                  action: 'SIGN IN',
                  buttonColor: Colors.green.shade900,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignInScreen(),
                      ),
                    );
                  }),
            ),
            SizedBox(
              height: 2.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Button(
                action: 'SIGN UP',
                buttonColor: Colors.blueAccent.shade400,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignUpScreen(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
