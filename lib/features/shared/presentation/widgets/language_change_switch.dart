import 'package:ecommerce_app/app/app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce_app/app/controllers/language_controller.dart';

class LanguageChangeSwitch extends StatelessWidget {
  const LanguageChangeSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    final languageController = CraftyBay.languageController;

    return GetBuilder<LanguageController>(
      builder: (_) {
        bool isEnglish = languageController.currentLocale.languageCode == 'en';

        return Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Language',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                GestureDetector(
                  onTap: () {
                    // Toggle between English and Bengali
                    Locale newLocale =
                    isEnglish ? Locale('bn') : Locale('en');
                    languageController.changeLocale(newLocale);
                  },
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 250),
                    width: 64,
                    height: 36,
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.amber.shade100,
                    ),
                    child: Stack(
                      children: [
                        AnimatedAlign(
                          duration: Duration(milliseconds: 250),
                          alignment: isEnglish
                              ? Alignment.centerLeft
                              : Alignment.centerRight,
                          child: Container(
                            width: 28,
                            height: 28,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.amber,
                            ),
                            child: Center(
                              child: Text(
                                isEnglish ? 'EN' : 'BN',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
