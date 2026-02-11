import 'package:ecommerce_app/app/app_colors.dart';
import 'package:ecommerce_app/app/constants.dart';
import 'package:ecommerce_app/features/shared/presentation/controllers/inc_dec_controller.dart';
import 'package:ecommerce_app/features/products/presentation/widgets/color_picker.dart';
import 'package:ecommerce_app/features/products/presentation/widgets/product_image_slider.dart';
import 'package:ecommerce_app/features/products/presentation/widgets/size_picker.dart';
import 'package:ecommerce_app/features/shared/presentation/widgets/inc_dec_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});
  static const String name = '/product-details';
  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text('Product details'),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProductImageSlider(),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Column(
                    spacing: 4,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GetBuilder<IncDecController>(builder: (incDecController) {
                        return Row(spacing: 4, children: [
                          Expanded(
                            child: Text(
                              'Nike A123 a new edition of jordan air',
                              style:
                                  textTheme.titleMedium?.copyWith(fontSize: 18),
                            ),
                          ),
                          IncDecButton(
                            icon: Icons.remove,
                            onTap: incDecController.removeCartButton,
                          ),
                          Text(
                            incDecController.currentValue.toString(),
                            style: textTheme.bodyLarge
                                ?.copyWith(fontWeight: FontWeight.w600),
                          ),
                          IncDecButton(
                            icon: Icons.add,
                            onTap: incDecController.addCartButton,
                          ),
                        ]);
                      }),
                      Row(
                        spacing: 2,
                        children: [
                          Wrap(
                            children: [
                              Icon(Icons.star, size: 18, color: Colors.amber),
                              Text('4.2'),
                            ],
                          ),
                          TextButton(onPressed: () {}, child: Text('Reviews')),
                          Card(
                            color: AppColors.themeColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(2),
                              child: Icon(
                                Icons.favorite_outline,
                                size: 14,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Color',
                    style: textTheme.titleMedium,
                  ),
                ),
                ColorPicker(colors: [
                  Colors.black,
                  Colors.teal,
                  Colors.brown,
                  Colors.grey.shade200,
                  Colors.grey
                ], onSelected: (color) {}),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Size',
                    style: textTheme.titleMedium,
                  ),
                ),
                SizePicker(sizes: [
                  'S',
                  'M',
                  'L',
                  'XL'
                ], onSelected: (size){}),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text('Description',style: textTheme.titleMedium,),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                  style: TextStyle(
                    color: Colors.grey.shade500
                  ),),
                ),
                  ],
            ),
          )),
          _buildPriceAndCart(textTheme),
        ],
      ),
    );
  }

  Widget _buildPriceAndCart(TextTheme textTheme) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: AppColors.themeColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                'Price',
                style: textTheme.titleMedium?.copyWith(fontSize: 18),
              ),
              Text(
                '${takaSign}100',
                style: textTheme.titleMedium
                    ?.copyWith(color: AppColors.themeColor),
              )
            ],
          ),
          SizedBox(
              width: 120,
              child:
                  FilledButton(onPressed: () {}, child: Text('Add to carts'))),
        ],
      ),
    );
  }
}
