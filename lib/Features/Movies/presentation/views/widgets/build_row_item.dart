import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BuildRowItem extends StatelessWidget {
  const BuildRowItem({
    super.key,
    required this.title,
    required this.subTitle,
    required this.onSeeMoreTap, // Add a callback for the tap event
  });

  final String title;
  final String subTitle;
  final VoidCallback onSeeMoreTap; // Callback type for tap event

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 19,
              color: Colors.white,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.15,
            ),
          ),
          InkWell(
            onTap: onSeeMoreTap, // Trigger the callback on tap
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    subTitle,
                    style: const TextStyle(color: Colors.white),
                  ),
                  const Icon(
                    Icons.arrow_forward_ios,
                    size: 16.0,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}