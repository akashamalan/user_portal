import 'package:flutter/material.dart';

class SignRegisterScreen extends StatefulWidget {
  const SignRegisterScreen({super.key});

  @override
  State<SignRegisterScreen> createState() => _SignRegisterScreenState();
}

class _SignRegisterScreenState extends State<SignRegisterScreen> {
  bool isLogin = false; // Toggle between Register and Login
  bool _isPasswordVisible = false;

  // Blue Brand Colors from your design
  static const Color primaryBlue = Color(0xFF3B82F6);
  static const Color lightBlueBg = Color(0xFFF0F5FF);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
            size: 20,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. BRAND LOGO SECTION (Based on SecureSOS design)
            Row(
              children: [
                const Icon(Icons.shield_outlined, color: primaryBlue, size: 32),
                const SizedBox(width: 8),
                Text(
                  "TeamNova",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'SF Pro Display',
                    color: Colors.blue.shade900,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),

            // 2. SEGMENTED TOGGLE (Create Account / Login)
            Container(
              height: 50,
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Expanded(child: _toggleBtn("Create Account", !isLogin)),
                  Expanded(child: _toggleBtn("Login", isLogin)),
                ],
              ),
            ),
            const SizedBox(height: 40),

            // 3. DYNAMIC HEADER
            Text(
              isLogin ? "Welcome Back" : "Join TeamNova",
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w900,
                fontFamily: 'SF Pro Display',
                letterSpacing: -0.5,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              isLogin
                  ? "Log in to access your travel network."
                  : "Register to ensure your safety is always prioritized.",
              style: const TextStyle(
                fontSize: 15,
                color: Colors.grey,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 35),

            // 4. FORM FIELDS
            if (!isLogin) ...[
              _buildLabel("Name (as per Aadhaar)"),
              _buildTextField("John Doe", Icons.person_outline),
              const SizedBox(height: 20),
            ],

            _buildLabel("Mobile Number"),
            Row(
              children: [
                Container(
                  width: 70,
                  height: 55,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: lightBlueBg,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.blue.shade100),
                  ),
                  child: const Text(
                    "+91",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildTextField(
                    "9876543210",
                    Icons.phone_android_outlined,
                    isPhone: true,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            if (!isLogin) ...[
              SizedBox(
                width: double.infinity,
                height: 50,
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    side: BorderSide(color: Colors.blue.shade100),
                    backgroundColor: lightBlueBg.withOpacity(0.5),
                  ),
                  child: const Text(
                    "Get OTP",
                    style: TextStyle(
                      color: primaryBlue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],

            _buildLabel("Password"),
            _buildPasswordField(),

            const SizedBox(height: 40),

            // 5. MAIN ACTION BUTTON
            SizedBox(
              width: double.infinity,
              height: 58,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: primaryBlue.withOpacity(0.3),
                      blurRadius: 15,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryBlue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        isLogin ? "Login" : "Create Account",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Icon(Icons.arrow_forward, size: 20),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper: Segmented Toggle Button
  Widget _toggleBtn(String label, bool active) {
    return GestureDetector(
      onTap: () => setState(() => isLogin = (label == "Login")),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: active ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          boxShadow: active
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ]
              : [],
        ),
        child: Text(
          label,
          style: TextStyle(
            color: active ? Colors.black : Colors.grey,
            fontWeight: active ? FontWeight.bold : FontWeight.w500,
          ),
        ),
      ),
    );
  }

  // Helper: Styled Label
  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, bottom: 8),
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
    );
  }

  // Helper: Standard Text Field
  Widget _buildTextField(String hint, IconData icon, {bool isPhone = false}) {
    return TextField(
      keyboardType: isPhone ? TextInputType.phone : TextInputType.text,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey.shade400),
        filled: true,
        fillColor: lightBlueBg.withOpacity(0.3),
        prefixIcon: Icon(icon, color: Colors.blue.shade200, size: 22),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.blue.shade50),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: primaryBlue, width: 1.5),
        ),
      ),
    );
  }

  // Helper: Password Field
  Widget _buildPasswordField() {
    return TextField(
      obscureText: !_isPasswordVisible,
      decoration: InputDecoration(
        hintText: "••••••••",
        filled: true,
        fillColor: lightBlueBg.withOpacity(0.3),
        prefixIcon: Icon(
          Icons.lock_outline,
          color: Colors.blue.shade200,
          size: 22,
        ),
        suffixIcon: IconButton(
          icon: Icon(
            _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
            color: Colors.grey,
          ),
          onPressed: () =>
              setState(() => _isPasswordVisible = !_isPasswordVisible),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.blue.shade50),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: primaryBlue, width: 1.5),
        ),
      ),
    );
  }
}
