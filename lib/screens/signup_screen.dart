import 'package:chatbuddy/screens/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../widgets/button.dart';
import '../widgets/myformfield.dart';

class SignUpScreen extends StatefulWidget {
  static const String routeName = 'SignUpScreen';
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreen();
}

class _SignUpScreen extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.arrow_back,
            size: 30,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Sign Up',
              style: GoogleFonts.mulish(
                textStyle:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            const MyFormField(
              myHintText: 'Phone number',
            ),
            SizedBox(
              height: 2.h,
            ),
            const MyFormField(
              myHintText: 'Password',
            ),
            SizedBox(
              height: 2.h,
            ),
            Button(
              action: 'SIGN UP',
             buttonColor: Colors.green.shade900,
              onPressed: () {},
            ),
           
            SizedBox(
              height: 5.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'You already have an account?.',
                  style: GoogleFonts.mulish(),
                ),
                TextButton(
                    onPressed: () {
                     Navigator.of(context).popAndPushNamed(SignInScreen.routeName);
                    },
                    child: const Text('Sign In'))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
