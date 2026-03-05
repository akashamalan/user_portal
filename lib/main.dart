import 'package:flutter/material.dart';
// IMPORT the new screens
import 'SignRegister.dart'; 

void main() {
  runApp(const TeamNovaApp());
}

class TeamNovaApp extends StatelessWidget {
  const TeamNovaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ridex - Team Nova',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'SF Pro Display', 
      ),
      home: const LanguageSelectionScreen(),
    );
  }
}

// ==========================================
// 1. PREMIUM LANGUAGE SELECTION
// ==========================================
class LanguageSelectionScreen extends StatelessWidget {
  const LanguageSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: -100,
            right: -50,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFFD09EFC).withOpacity(0.15),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Choose Language',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w900,
                      letterSpacing: -1.0,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Select your preferred language to continue',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 60),
                  _langBtn(context, 'English'),
                  const SizedBox(height: 20),
                  _langBtn(context, 'தமிழ் (Tamil)'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _langBtn(BuildContext context, String text) {
    return Container(
      width: double.infinity,
      height: 58,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          )
        ],
      ),
      child: ElevatedButton(
        onPressed: () => Navigator.push(
          context, 
          MaterialPageRoute(builder: (context) => const GetStartedHomeScreen())
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
        child: Text(
          text,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

// ==========================================
// 2. GET STARTED HOME SCREEN
// ==========================================
class GetStartedHomeScreen extends StatelessWidget {
  const GetStartedHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SafeArea(
            bottom: false,
            child: Column(
              children: [
                // Top Bar
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Register',
                        style: TextStyle(fontSize: 34, fontWeight: FontWeight.w900, letterSpacing: -1.5),
                      ),
                      CircleAvatar(radius: 18, backgroundColor: Colors.grey.shade300),
                    ],
                  ),
                ),

                // Blue Typography Section
                Container(
                  width: double.infinity,
                  height: 338,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assest/blue colour.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 28.0, top: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Ride', style: TextStyle(fontSize: 110, fontWeight: FontWeight.w900, height: 0.9, letterSpacing: -4, color: Colors.black)),
                        Container(height: 3, width: 240, color: const Color(0xFF1E88E5)),
                        const Text('With', style: TextStyle(fontSize: 65, fontWeight: FontWeight.w900, height: 1.1, color: Colors.white)),
                        _dashedLine(),
                        const Text('Safe.', style: TextStyle(fontSize: 110, fontWeight: FontWeight.w900, height: 1.0, letterSpacing: -4, color: Colors.black)),
                      ],
                    ),
                  ),
                ),

                // Bottom Domes & Buttons
                Expanded(
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        bottom: -150,
                        child: Container(
                          width: 550,
                          height: 500,
                          decoration: const BoxDecoration(
                            color: Color(0xFFF0F0F0),
                            borderRadius: BorderRadius.all(Radius.elliptical(550, 500)),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: -170,
                        child: Container(
                          width: 520,
                          height: 500,
                          decoration: const BoxDecoration(
                            color: Color(0xFFD09EFC),
                            borderRadius: BorderRadius.all(Radius.elliptical(520, 500)),
                          ),
                        ),
                      ),
                      
                      // Footer Layout
                      Positioned(
                        bottom: 110, 
                        child: Column(
                          children: [
                            Container(
                              width: 343,
                              height: 55,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                gradient: const LinearGradient(colors: [Color(0xFFE6F0FF), Color(0xFF3B82F6)]),
                              ),
                              child: ElevatedButton(
                                onPressed: () {
                                  // FIXED NAVIGATION: Now goes to SignRegisterScreen
                                  Navigator.push(
                                    context, 
                                    MaterialPageRoute(builder: (context) => const SignRegisterScreen())
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  shadowColor: Colors.transparent,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                                ),
                                child: const Text('Get Started', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w800)),
                              ),
                            ),
                            const SizedBox(height: 18),
                            
                            // "Sign in" link in Sky Blue
                            GestureDetector(
                              onTap: () {
                                // FIXED NAVIGATION: Also leads to SignRegisterScreen (Login mode)
                                Navigator.push(
                                  context, 
                                  MaterialPageRoute(builder: (context) => const SignRegisterScreen())
                                );
                              },
                              child: RichText(
                                text: const TextSpan(
                                  style: TextStyle(
                                    fontFamily: 'SF Pro Display',
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black,
                                  ),
                                  children: [
                                    TextSpan(text: "Already Signed in ? "),
                                    TextSpan(
                                      text: "Sign in",
                                      style: TextStyle(
                                        color: Color(0xFF00BFFF), 
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _dashedLine() {
    return SizedBox(
      width: 153,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(5, (i) => Container(height: 5, width: 26, color: Colors.black)),
      ),
    );
  }
}