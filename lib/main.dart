import 'package:flutter/material.dart';
import 'package:karigar/pages/splash_screen.dart';
import 'package:karigar/pages/home_page.dart';
import 'package:karigar/pages/profile/profile_page.dart';
import 'package:karigar/pages/profile/edit_profile_page.dart';
import 'package:karigar/pages/profile/manage_address_page.dart';
import 'package:karigar/pages/profile/edit_address_page.dart';

void main() {
  runApp(const KarigarApp());
}

class KarigarApp extends StatelessWidget {
  const KarigarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Karigar',
      theme: ThemeData(
        fontFamily: 'Roboto',
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFFFD7A00)),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/home': (context) => const HomePageWidget(),
        '/profile': (context) => const ProfilePage(),
        '/edit-profile': (context) => const EditProfilePage(),
        '/manage-address': (context) => const ManageAddressPage(),
        '/edit-address': (context) => const EditAddressPage(),
      },
    );
  }
}
