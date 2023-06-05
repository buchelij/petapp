import 'package:flutter/material.dart';
import 'package:petapp/pages/auth_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:petapp/pages/home_page.dart';
import 'package:petapp/pages/profile_page.dart';
import 'package:petapp/pages/register_page.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    //contained const for the authpage
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfilePage1(),
    );
  }
}
