import 'package:flutter/material.dart';
import 'dart:ui'; // REQUIRED: Fixes the ImageFilter error

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Exact Figma Frame Dimensions: 393 x 852
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. HEADER BAR (157x38 Welcome / 42x42 Profile)
              Padding(
                padding: const EdgeInsets.only(
                  left: 24,
                  right: 24,
                  top: 16,
                  bottom: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      width: 157,
                      height: 38,
                      child: Text(
                        'Welcome',
                        style: TextStyle(
                          fontSize: 34,
                          fontWeight: FontWeight.w900,
                          letterSpacing: -1.5,
                          fontFamily: 'SF Pro Display',
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Container(
                      width: 42,
                      height: 42,
                      decoration: const BoxDecoration(
                        color: Color(0xFFE0E0E0),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                  ],
                ),
              ),

              // 2. HERO SECTION (393 x 338)
              Container(
                width: screenWidth,
                height: 338,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assest/blue colour.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Center(
                  child: Container(
                    width: 276,
                    height: 243,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.2),
                        width: 1.5,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                        child: Container(
                          alignment: Alignment.center,
                          child: const Icon(
                            Icons.shield_rounded,
                            size: 100,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              // 3. INSTRUCTIONS PANEL
              Transform.translate(
                offset: const Offset(0, -30),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.08),
                          blurRadius: 40,
                          offset: const Offset(0, -10),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.only(
                      top: 30,
                      bottom: 40,
                      left: 20,
                      right: 20,
                    ),
                    child: Column(
                      children: [
                        Container(
                          width: 40,
                          height: 5,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          "Instructions",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        const SizedBox(height: 35),

                        // QR ROW (93x90 Box / 193x90 Bubble)
                        _buildInstructionRow(
                          imagePath: 'assest/QR Design.png',
                          points: [
                            "Scan the QR Code from the Driver Vehicle",
                            "That code used to give the driver detail",
                            "This feature is to protect the person",
                          ],
                        ),
                        const SizedBox(height: 30),

                        // ID ROW (93x90 Box / 193x90 Bubble)
                        _buildInstructionRow(
                          imagePath: 'assest/ID CARD.JPG',
                          points: [
                            "In that profile contain the driver's photo",
                            "The information stores the vehicle detail",
                            "The user can verify the detail of the driver",
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInstructionRow({
    required String imagePath,
    required List<String> points,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 93,
          height: 90,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(28)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(28),
            child: Image.asset(imagePath, fit: BoxFit.cover),
          ),
        ),
        const SizedBox(width: 15),
        Container(
          width: 193,
          height: 90,
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          decoration: BoxDecoration(
            color: const Color(0xFFF5F5F7),
            borderRadius: BorderRadius.circular(28),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: points
                .map(
                  (p) => Padding(
                    padding: const EdgeInsets.only(bottom: 3),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 4, right: 6),
                          width: 4,
                          height: 4,
                          decoration: const BoxDecoration(
                            color: Colors.black54,
                            shape: BoxShape.circle,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            p, // FIXED: Now uses the correct variable 'p' from the map function
                            style: const TextStyle(
                              fontSize: 9,
                              fontWeight: FontWeight.w600,
                              height: 1.2,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}
