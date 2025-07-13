import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';

class SelectOption extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;
  const SelectOption({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: isSelected ? AppColors.primary : AppColors.secondBackground,
        ),
        child: Center(child: Text(title)),
      ),
    );
  }
}
