import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class ChatScreen extends StatefulWidget {
  static const String routeName = 'ChatScreen';
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreen();
}

class _ChatScreen extends State<ChatScreen> {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  late User loggedInUser;
  late String messageText;

  @override
  void initState() {
    getCurrentUser();
    super.initState();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser!;
      loggedInUser = user;
      print(loggedInUser.email);
    } catch (e) {}
  }

// this method is for getting live messages to and from the cloud firestore.
  void messageStream() async {
    await for (var snapshot in _firestore.collection('messages').snapshots()) {
      for (var message in snapshot.docs) {
        print(message.data());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            // _auth.signOut();
            // Navigator.pop(context);
            messageStream();
          },
          icon: const Icon(Icons.refresh),
        ),
        title: Text(
          'Chats',
          style: GoogleFonts.lobster(
            fontSize: 25.sp,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  maxLines: 1,
                  onChanged: (value) {
                    messageText = value;
                  },
                  decoration: const InputDecoration(
                    focusColor: Colors.grey,
                    hintText: 'Type your message here...',
                  ),
                ),
              ),
              SizedBox(
                width: 5.w,
              ),
              ElevatedButton(
                  onPressed: () {
                    _firestore.collection('messages').add({
                      'sender': loggedInUser.email,
                      'text': messageText,
                    });
                  },
                  child: Text(
                    'Send',
                    style: GoogleFonts.mulish(
                      textStyle: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.w400),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
