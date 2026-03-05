import 'package:flutter/material.dart';
// ERROR 1 FIX: You must import the file where VolumeCustomizationScreen is defined
import 'VolumeCustomization.dart'; 

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  static const Color primaryBlue = Color(0xFF3B82F6);
  static const Color lightBlueBg = Color(0xFFF0F5FF);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 80),
              const Row(
                children: [
                  Icon(Icons.shield_rounded, color: primaryBlue, size: 40),
                  SizedBox(width: 12),
                  Text(
                    "TeamNova", 
                    style: TextStyle(
                      fontSize: 28, 
                      fontWeight: FontWeight.w900, 
                      color: Color(0xFF0D47A1)
                    )
                  ),
                ],
              ),
              const SizedBox(height: 40),
              const Text(
                "Create Account", 
                style: TextStyle(fontSize: 34, fontWeight: FontWeight.w900, letterSpacing: -1.0)
              ),
              const SizedBox(height: 50),
              _buildField("Full Name", "Enter your name", Icons.person_outline),
              const SizedBox(height: 25),
              _buildField("Mobile Number", "9876543210", Icons.phone_android_rounded, isPhone: true),
              const SizedBox(height: 25),
              _buildField("Password", "••••••••", Icons.lock_outline, isPassword: true),
              const SizedBox(height: 60),
              SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate to SOS Customization
                    Navigator.push(
                      context, 
                      MaterialPageRoute(builder: (context) => const VolumeCustomizationScreen())
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryBlue,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  ),
                  child: const Text(
                    "Sign Up", 
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)
                  ),
                ),
              ),
              const SizedBox(height: 40), // Added padding for better scroll feel
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildField(String label, String hint, IconData icon, {bool isPassword = false, bool isPhone = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
        const SizedBox(height: 8),
        TextField(
          obscureText: isPassword,
          keyboardType: isPhone ? TextInputType.phone : TextInputType.text,
          decoration: InputDecoration(
            hintText: hint,
            prefixIcon: Icon(icon, color: primaryBlue),
            filled: true,
            fillColor: lightBlueBg,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18), 
              borderSide: BorderSide.none
            ),
          ),
        ),
      ],
    );
  }
} // ERROR 2 FIX: Ensure this final closing bracket exists
