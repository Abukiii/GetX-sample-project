import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final bool isEnabled;
  final VoidCallback onPressed;
  final String label;

  const CustomElevatedButton({
    required this.isEnabled,
    required this.onPressed,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: isEnabled ? onPressed : null,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            isEnabled ? Colors.black : const Color.fromARGB(255, 198, 197, 197),
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
          minimumSize: MaterialStateProperty.all<Size>(
            const Size(double.infinity, 50.0),
          ),
        ),
        child: Text(
          label,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}