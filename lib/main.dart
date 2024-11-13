import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shop_mart/pages/admin/add_item.dart';

import 'package:shop_mart/pages/admin/admin_login.dart';
import 'package:shop_mart/pages/admin/home_admin.dart';
//import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:shop_mart/pages/bottomNav.dart';
import 'package:shop_mart/pages/login.dart';
import 'package:shop_mart/pages/signUp.dart';
import 'package:shop_mart/pages/wallet.dart';
import 'package:shop_mart/widget/app_constans.dart';
import 'firebase_options.dart'; // Add this import


void main() async {
  
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: AddItem(),
    );
  }
}
