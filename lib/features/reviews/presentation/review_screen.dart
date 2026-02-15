import 'package:ecommerce_app/app/app_colors.dart';
import 'package:ecommerce_app/app/back_to_home.dart';
import 'package:ecommerce_app/features/reviews/presentation/create_review_screen.dart';
import 'package:flutter/material.dart';

import '../../../app/constants.dart';
class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key});

 static const String name = '/review-screen';

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
        appBar: AppBar(
          title: Text('Reviews'),
          backgroundColor: Colors.white,
         // leading: BackButton(onPressed: BackToHome.backToHome,),
        ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemCount: 5,
                itemBuilder:(context,index){
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          spacing: 8,
                          children: [
                            Row(
                              spacing: 4,
                              children: [
                                Icon(Icons.person),
                                Text("Abdullah Al Saeim"),
                              ],
                            ),
                            Text(
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                              style: TextStyle(color: Colors.grey.shade400),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(height: 8,);
            },
            ),
          ),

          _buildReviewsAndAdd(textTheme)





    ],
      ),
    );
  }
  Widget _buildReviewsAndAdd(TextTheme textTheme) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: AppColors.themeColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                'Reviews',
                style: textTheme.titleMedium?.copyWith(fontSize: 18),
              ),
              Text(
                '(1000)',
                style: textTheme.titleMedium
                    ?.copyWith(color: Colors.grey),
              )
            ],
          ),
          SizedBox(
              width: 120,
              child:
              FilledButton(onPressed: _onTapToCreateReviewScreenButton, child: Icon(Icons.add)),)
        ],
      ),
    );
  }
 void _onTapToCreateReviewScreenButton(){
    Navigator.pushNamed(context, CreateReviewScreen.name);
 }
}
