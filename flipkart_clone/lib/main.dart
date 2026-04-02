import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/main_screen.dart';
import 'screens/login_signup_screen.dart';

void main() {
  runApp(const FlipkartCloneApp());
}

class FlipkartCloneApp extends StatelessWidget {
  const FlipkartCloneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flipkart Clone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF2874F0), // Flipkart Blue
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2874F0),
          secondary: const Color(0xFFF1A900), // Action Yellow
        ),
        scaffoldBackgroundColor: const Color(0xFFF1F3F6), // Light Grey Background
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF2874F0),
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        useMaterial3: true,
      ),
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/login': (context) => const LoginSignupScreen(),
        '/main': (context) => const MainScreen(),
      },
    );
  }
}
