import 'package:ecommerce_app/app/app_colors.dart';
import 'package:flutter/material.dart';
class ProductCategoryItem extends StatelessWidget {
  const ProductCategoryItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 6,
      children: [
        Container(
          padding: EdgeInsets.all(16),
          decoration:BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.themeColor.withOpacity(0.15)
          ),
          child: Icon(Icons.computer,color: AppColors.themeColor,size: 32,),
        ),
        Text('Electronics',style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: AppColors.themeColor
        ),)
      ],
    );
  }
}
