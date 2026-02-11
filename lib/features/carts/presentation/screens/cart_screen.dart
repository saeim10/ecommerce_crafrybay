import 'package:ecommerce_app/app/app_colors.dart';
import 'package:ecommerce_app/app/assets_path.dart';
import 'package:ecommerce_app/app/back_to_home.dart';
import 'package:ecommerce_app/app/constants.dart';
import 'package:ecommerce_app/features/shared/presentation/controllers/inc_dec_controller.dart';
import 'package:ecommerce_app/features/shared/presentation/widgets/inc_dec_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
        appBar: AppBar(
          title: Text('Carts'),
          leading: BackButton(
            onPressed: BackToHome.backToHome,
          ),
          backgroundColor: Colors.white,
        ),
        body: Column(
          children: [
            Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return Card(
                        child: Row(
                          spacing: 4,
                          children: [
                            Container(
                              margin: EdgeInsets.all(8),
                                child: Image.asset(AssetsPath.shoePng, height: 80,width: 80,)
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:CrossAxisAlignment.start ,
                                          children: [
                                            Text('Nike air 2025 edition brand new',style: textTheme.titleMedium?.copyWith(fontSize: 15),),
                                            Text('Size: 43 Color: Blue',style: textTheme.bodyMedium,),
                                          ],
                                        ),
                                      ),
                                      IconButton(onPressed: (){}, icon: Icon(Icons.delete)),
                                    ],
                                  ),
                                  GetBuilder<IncDecController>(
                                    builder: (controller) {
                                      return Row(

                                        children: [
                                          Expanded(
                                            child: Text(
                                              '${takaSign}100',
                                              style: textTheme.titleMedium
                                                  ?.copyWith(color: AppColors.themeColor,fontSize:18),
                                            ),
                                          ),
                                          IncDecButton(icon: Icons.remove, onTap: controller.removeCartButton),
                                          Text(
                                            controller.currentValue.toString(),
                                            style: textTheme.bodyLarge
                                                ?.copyWith(fontWeight: FontWeight.w600),
                                          ),
                                          IncDecButton(icon: Icons.add, onTap: controller.addCartButton)
                                        ],
                                      );
                                    }
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) { return SizedBox(height: 8,);},
                    itemCount: 5)),
            _buildPriceAndCart(textTheme)
          ],
        ));
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
                '${takaSign}1000',
                style: textTheme.titleMedium
                    ?.copyWith(color: AppColors.themeColor),
              )
            ],
          ),
          SizedBox(
              width: 120,
              child:
                  FilledButton(onPressed: () {}, child: Text('Checkout'))),
        ],
      ),
    );
  }
}
