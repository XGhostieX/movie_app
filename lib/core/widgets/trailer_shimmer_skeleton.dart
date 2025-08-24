import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class TrailerShimmerSkeleton extends StatelessWidget {
  const TrailerShimmerSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        height: 185,
        decoration: const BoxDecoration(color: Colors.grey),
      ),
    );
  }
}
