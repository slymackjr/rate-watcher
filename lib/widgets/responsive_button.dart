/*
import 'package:flutter/material.dart';

class ResponsiveButton extends StatelessWidget {
  final bool? isResponsive;
  final double? width;
  const ResponsiveButton({super.key, this.isResponsive=false, this.width, required VoidCallback onPressed, required String text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.amber
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/arrow-icon.png")
        ],
      ),
    );
  }
}
*/
import 'package:flutter/material.dart';

class ResponsiveButton extends StatelessWidget {
  final bool? isResponsive;
  final double? width;
  final VoidCallback onPressed; // Added onPressed parameter
  const ResponsiveButton({
    super.key,
    this.isResponsive = false,
    this.width,
    required this.onPressed, // Required onPressed parameter
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector( // Changed to GestureDetector to handle taps
      onTap: onPressed, // Call onPressed when tapped
      child: Container(
        width: width,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.amber,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/arrow-icon.png"),
          ],
        ),
      ),
    );
  }
}
