import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class GenresShimmerSkeleton extends StatelessWidget {
  const GenresShimmerSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: const Wrap(
        spacing: 10,
        children: [
          Chip(label: Text('Adventuree')),
          Chip(label: Text('Adventuree')),
          Chip(label: Text('Adventuree')),
        ],
      ),
    );
  }
}
