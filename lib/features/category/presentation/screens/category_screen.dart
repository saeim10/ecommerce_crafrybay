
import 'package:ecommerce_app/app/back_to_home.dart';
import 'package:ecommerce_app/features/shared/presentation/widgets/product_category_item.dart';
import 'package:flutter/material.dart';
class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_,__){
        return BackToHome.backToHome();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Categories'),
          leading: BackButton(onPressed: BackToHome.backToHome),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GridView.builder(
            itemCount: 10,
              gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 8,
                crossAxisSpacing: 8
              ) ,
              itemBuilder: (context,index){
              return FittedBox(child: ProductCategoryItem());
              }
          ),
        ),
      ),
    );
  }

}
