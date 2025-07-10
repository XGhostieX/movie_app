import 'package:flutter/material.dart';

class ReleaseDateRate extends StatelessWidget {
  final String releaseDate;
  final double voteAverage;

  const ReleaseDateRate({
    super.key,
    required this.releaseDate,
    required this.voteAverage,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(
              Icons.calendar_month_rounded,
              size: 20,
              color: Colors.grey,
            ),
            Text(
              '  ${releaseDate.toString().split(' ')[0]}',
              style: const TextStyle(color: Colors.grey),
            ),
          ],
        ),
        Row(
          children: [
            const Icon(Icons.star, size: 20, color: Colors.amber),
            Text(
              ' ${voteAverage.toStringAsFixed(1)}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }
}
