import 'package:flutter/material.dart';
import '../widgets/custom_text_field.dart';
import 'signup_screen.dart';
import 'home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 243, 222, 239),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 10),

            // Back Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),

            const SizedBox(height: 10),

            // Stack للنص + الصورة + البوكس الأبيض
            Expanded(
              child: Stack(
                clipBehavior:
                    Clip.none, // يسمح للصورة بالخروج جزئيًا فوق البوكس
                children: [
                  // Row للنص + الصورة
                  Positioned(
                    top: -30,
                    left: 30,
                    right: 30,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // النص على اليسار
                        const Expanded(
                          child: Text(
                            'ToDo',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                        const SizedBox(width: 16),

                        // الصورة على اليمين
                        Padding(
                          padding: const EdgeInsets.only(right: 50),
                          child: Image.asset(
                            'assets/images/clients.23f64288.png',
                            height: 340,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // البوكس الأبيض يغطي جزء صغير من أسفل الصورة
                  Positioned(
                    top: 200, // يبدأ بعد الصورة لتغطية جزء صغير فقط
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      padding: const EdgeInsets.all(24),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 10),
                            const Text(
                              'Welcome Back 👋',
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'Login to manage your tasks',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 30),

                            // Email
                            const Text('Email Address'),
                            const SizedBox(height: 8),
                            const CustomTextField(
                              hintText: 'amalsafi472003@email.com',
                              keyboardType: TextInputType.emailAddress,
                            ),
                            const SizedBox(height: 16),

                            // Password
                            const Text('Password'),
                            const SizedBox(height: 8),
                            const CustomTextField(
                              hintText: '********',
                              obscureText: true,
                              suffixIcon: Icon(Icons.visibility_off),
                            ),
                            const SizedBox(height: 30),

                            // Gradient Login Button
                            GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (_) => const HomeScreen(),
    ),
  );
                              },
                              child: Container(
                                width: double.infinity,
                                height: 55,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color(0xFFFFBFFB),
                                      Color(0xFFFF9BFF),
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                ),
                                child: const Center(
                                  child: Text(
                                    'Login',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 30),

                            // Go to Sign Up
                            Center(
                              child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => const SignUpScreen(),
                                    ),
                                  );
                                },
                                child: const Text(
                                  'Don’t have an account? Register',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xFF9B7EDC),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
