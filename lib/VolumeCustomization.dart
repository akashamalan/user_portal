import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VolumeCustomizationScreen extends StatefulWidget {
  const VolumeCustomizationScreen({super.key});

  @override
  State<VolumeCustomizationScreen> createState() =>
      _VolumeCustomizationScreenState();
}

class _VolumeCustomizationScreenState extends State<VolumeCustomizationScreen> {
  List<String> volumeSequence = [];
  bool isRecording = false;
  
  // This node allows the app to "listen" to physical button events
  final FocusNode _focusNode = FocusNode();

  static const Color primaryBlue = Color(0xFF3B82F6);
  static const Color lightBlueBg = Color(0xFFF0F5FF);

  @override
  void dispose() {
    _focusNode.dispose(); // Clean up the focus node
    super.dispose();
  }

  // Logic to handle physical volume button presses
  void _handleHardwareKeyPress(RawKeyEvent event) {
    if (event is RawKeyDownEvent) {
      if (event.logicalKey == LogicalKeyboardKey.audioVolumeUp) {
        _addKey("UP");
      } else if (event.logicalKey == LogicalKeyboardKey.audioVolumeDown) {
        _addKey("DOWN");
      }
    }
  }

  void _addKey(String type) {
    if (volumeSequence.length < 5) {
      setState(() {
        volumeSequence.add(type);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Ensure the screen is ready to receive button events
    FocusScope.of(context).requestFocus(_focusNode);

    return RawKeyboardListener(
      focusNode: _focusNode,
      autofocus: true,
      onKey: _handleHardwareKeyPress,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 20),
            onPressed: () => Navigator.pop(context),
          ),
          title: const Text(
            "SOS Customization",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text(
                "Set Volume PIN",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w900,
                  fontFamily: 'SF Pro Display',
                  letterSpacing: -1.0,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Press your phone's physical volume buttons to create a sequence, or use the manual buttons below.",
                style: TextStyle(fontSize: 16, color: Colors.grey, height: 1.4),
              ),
              const SizedBox(height: 50),

              // VISUAL SEQUENCE DISPLAY
              Center(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: lightBlueBg.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.blue.shade100),
                  ),
                  child: Column(
                    children: [
                      const Text(
                        "Current Sequence",
                        style: TextStyle(color: primaryBlue, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: volumeSequence.isEmpty
                            ? [const Text("Press Volume Up/Down", style: TextStyle(color: Colors.grey))]
                            : volumeSequence.map((btn) => _buildKeyIndicator(btn)).toList(),
                      ),
                      if (volumeSequence.isNotEmpty)
                        TextButton(
                          onPressed: () => setState(() => volumeSequence.clear()),
                          child: const Text("Clear All", style: TextStyle(color: Colors.redAccent)),
                        ),
                    ],
                  ),
                ),
              ),

              const Spacer(),

              // MANUAL OPTION (Secondary Choice)
              const Center(
                child: Text(
                  "OR CREATE MANUALLY",
                  style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Expanded(
                    child: _buildManualBtn("Volume Up", Icons.add_circle_outline, () => _addKey("UP")),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: _buildManualBtn("Volume Down", Icons.remove_circle_outline, () => _addKey("DOWN")),
                  ),
                ],
              ),

              const SizedBox(height: 40),

              // SAVE BUTTON
              SizedBox(
                width: double.infinity,
                height: 58,
                child: ElevatedButton(
                  onPressed: volumeSequence.length >= 3
                      ? () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Hardware SOS PIN Saved!")),
                          );
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryBlue,
                    foregroundColor: Colors.white,
                    disabledBackgroundColor: Colors.grey.shade300,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    elevation: 0,
                  ),
                  child: const Text("Set Sequence", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildKeyIndicator(String type) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: primaryBlue,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: primaryBlue.withOpacity(0.3), blurRadius: 8, offset: const Offset(0, 4)),
        ],
      ),
      child: Icon(
        type == "UP" ? Icons.arrow_upward : Icons.arrow_downward,
        color: Colors.white,
        size: 24,
      ),
    );
  }

  Widget _buildManualBtn(String label, IconData icon, VoidCallback tap) {
    return InkWell(
      onTap: tap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.black54),
            const SizedBox(width: 8),
            Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}