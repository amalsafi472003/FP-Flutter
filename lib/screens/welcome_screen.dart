import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'signup_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 243, 222, 239),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),

            Stack(
              alignment: Alignment.center,
              children: [
                // الدائرة
                Positioned(
                  top: 50,
                  left: 130,
                  child: Container(
                    width: 240,
                    height: 240,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(
                        255,
                        255,
                        255,
                        255,
                      ), // أبيض مائل للأصفر
                      shape: BoxShape.circle,
                    ),
                  ),
                ),

                // الصورة
                Padding(
                  padding: const EdgeInsets.only(left: 80),
                  child: Image.asset('assets/images/hello.png', height: 350),
                ),
              ],
            ),

            const SizedBox(height: 40),

            const Text(
              'Organize your tasks',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2E2E2E),
              ),
            ),

            const SizedBox(height: 12),

            const Text(
              'Stay productive and manage your daily to-dos easily',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),

            const SizedBox(height: 40),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const SignUpScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets
                      .zero, // مهم عشان الـ gradient يشيل كامل مساحة الزر
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Ink(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF9B7EDC), // اللون الفاتح
                        Color(0xFFFFBFFB), // اللون الغامق بنفسجي
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    child: const Text(
                      'Get Started',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white, // لازم نص يكون واضح على gradient
                      ),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const LoginScreen()),
                );
              },
              child: const Text(
                'Already have an account? Sign in',
                style: TextStyle(color: Color(0xFF9B7EDC)),
              ),
            ),

            const Spacer(),
          ],
        ),
      ),
    );
  }
}
