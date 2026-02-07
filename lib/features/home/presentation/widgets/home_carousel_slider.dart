import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/app/app_colors.dart';
import 'package:ecommerce_app/features/home/presentation/controllers/home_carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class HomeCarouselSlider extends StatefulWidget {
  const HomeCarouselSlider({
    super.key,
  });

  @override
  State<HomeCarouselSlider> createState() => _HomeCarouselSliderState();
}

class _HomeCarouselSliderState extends State<HomeCarouselSlider> {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeCarouselController>(
      builder: (carouselController) {
        return Column(
          spacing: 4,
          children: [
            CarouselSlider(
              options: CarouselOptions(
                  height: 180,
                  viewportFraction: 1,
                  onPageChanged: (int index, CarouselPageChangedReason reason) {
                    carouselController.onPageChanged(index);
                  }),
              items: [1, 2, 3, 4, 5].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                            color: AppColors.themeColor,
                            borderRadius: BorderRadius.circular(8)),
                        alignment: Alignment.center,
                        child: Text(
                          'text $i',
                          style: TextStyle(fontSize: 16.0),
                        ));
                  },
                );
              }).toList(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for(int i = 0; i < 5; i++)
                Container(
                  width: 12,
                  height: 12,
                  margin: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: carouselController.currentIndex == i ? AppColors.themeColor:Colors.transparent,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey)
                  ),
                )
              ],
            )
          ],
        );
      }
    );
  }
}
