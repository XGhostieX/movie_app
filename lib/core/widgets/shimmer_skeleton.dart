import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerSkeleton extends StatelessWidget {
  const ShimmerSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.separated(
        itemCount: 20,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemBuilder: (context, index) => Column(
          children: [
            Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Container(
                width: 167,
                height: 250,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 10),
            Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Container(
                width: 167,
                height: 15,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
