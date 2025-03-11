import 'package:flutter/material.dart';

class BuildRowDetails extends StatelessWidget {
  const BuildRowDetails({super.key, required this.voteAverage,});

  final double voteAverage;
  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        const Icon(
          Icons.star,
          color: Colors.amber,
          size: 20.0,
        ),
        const SizedBox(width: 4.0),
        Text(voteAverage.toString(),
          style: const TextStyle(
            fontSize: 16.0,
            color: Colors.white70,
            fontWeight: FontWeight.w500,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(width: 4.0),
        const Text("...",
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
