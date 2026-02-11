import 'package:ecommerce_app/app/back_to_home.dart';
import 'package:ecommerce_app/features/shared/presentation/widgets/product_card.dart';
import 'package:flutter/material.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key,});



  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('WishList',style: TextStyle(color: Colors.black),),backgroundColor: Colors.white,leading: BackButton(onPressed: BackToHome.backToHome,),),
      body: GridView.builder(
        itemCount: 50,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 8
        ),
        itemBuilder: (context, index) {
          return FittedBox(child: ProductCard());
        },
      ),
    );
  }
}