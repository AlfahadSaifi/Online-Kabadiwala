import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:scrap_saathi/screens/auth_screen.dart';
import 'package:scrap_saathi/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final bool hasData = true;
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Still waiting for authentication state, show SplashScreen
            return SplashScreen();
          }

          User? user = snapshot.data;

          if (user != null) {
            // User is signed in
            return HomeScreen(selectedIndex: 0);
          } else {
            // User is signed out or sign-in was unsuccessful
            return AuthScreen();
          }
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Lottie.asset('assets/animations/splash.json'),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 40),
              child: Text(
                'Scrap Saathi',
                style: GoogleFonts.roboto(
                  textStyle: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
