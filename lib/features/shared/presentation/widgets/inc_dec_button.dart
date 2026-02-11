
import 'package:ecommerce_app/app/app_colors.dart';
import 'package:flutter/material.dart';
class IncDecButton extends StatelessWidget {
  const IncDecButton({
    super.key, required this.icon, required this.onTap,
  });
 final IconData icon;
 final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.themeColor
        ),
        child: Icon(icon,color: Colors.white,),
      ),
    );
  }
}
