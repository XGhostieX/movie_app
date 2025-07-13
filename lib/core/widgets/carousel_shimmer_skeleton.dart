import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CarouselShimmerSkeleton extends StatelessWidget {
  const CarouselShimmerSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Container(
              width: 250,
              height: 265,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 15,
          child: ListView.separated(
            itemCount: 12,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 35),
            separatorBuilder: (context, index) => const SizedBox(width: 15),
            itemBuilder: (context, index) => Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Container(
                width: 10,
                height: 10,
                decoration: const BoxDecoration(
                  color: Colors.grey,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
