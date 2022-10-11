import 'package:chatbuddy/screens/signup_screen.dart';
import 'package:chatbuddy/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../widgets/myformfield.dart';

class SignInScreen extends StatefulWidget {
  static const String routeName = 'SignInScreen';
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreen();
}

class _SignInScreen extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              'Sign In',
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
              action: 'SIGN IN',
             buttonColor: Colors.green.shade900,
              onPressed: () {},
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'Forgot Password?',
                style: GoogleFonts.mulish(),
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don\'t have an account?.',
                  style: GoogleFonts.mulish(),
                ),
                TextButton(
                     onPressed: () {
                     Navigator.of(context).popAndPushNamed(SignUpScreen.routeName);
                    },
                    child: const Text('Sign Up'))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
