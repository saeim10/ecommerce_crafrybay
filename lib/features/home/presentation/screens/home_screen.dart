import 'package:ecommerce_app/app/assets_path.dart';
import 'package:ecommerce_app/features/home/presentation/widgets/app_bar_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: SvgPicture.asset(AssetsPath.logoNavSvg),
        actions: [
          AppBarIconButton(onTap: () {  }, icons: Icons.person,),
          AppBarIconButton(onTap: (){}, icons: Icons.call),
          AppBarIconButton(onTap: (){}, icons: Icons.notifications_active_outlined)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const SizedBox(height: 16,),
            _searchTextField()
          ],
        ),
      ),
    );
  }

  Widget _searchTextField() {
    return TextField(
            textInputAction: TextInputAction.search,
            decoration: InputDecoration(
              hintText: 'Search',
               enabledBorder: OutlineInputBorder(
                 borderSide: BorderSide.none
               ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide.none
            ),
            filled: true,
              fillColor: Colors.grey.shade200,
              prefixIcon: Icon(Icons.search),
            ),
          );
  }
}

