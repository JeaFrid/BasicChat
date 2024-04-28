import 'package:basic_chat/page/home.dart';
import 'package:basic_chat/page/login.dart';
import 'package:cosmos/cosmos.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //UYARI: UYGULAMAYA FIREBASE BAĞLAYIN VE BU KODU ETKİN YAPIN.
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  runApp(const ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CosmosFirebase.isSignedIn() ? const HomePage() : const Login(),
    );
  }
}
