import 'package:flutter/material.dart';

class BuildRowDetails extends StatelessWidget {
  const BuildRowDetails({
    super.key,});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Icon(
          Icons.star,
          color: Colors.amber,
          size: 20.0,
        ),
        SizedBox(width: 4.0),
        Text("3,3",
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.white70,
            fontWeight: FontWeight.w500,
            letterSpacing: 1.2,
          ),
        ),
        SizedBox(width: 4.0),
        Text("...",
          style: TextStyle(
            fontSize: 1.0,
            color: Colors.white70,
            fontWeight: FontWeight.w500,
            letterSpacing: 1.2,
          ),
        ),
      ],
    );
  }
}
