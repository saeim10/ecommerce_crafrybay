import 'package:flutter/material.dart';

class AppBarIconButton extends StatelessWidget {
  const AppBarIconButton({
    super.key, required this.onTap, required this.icons,
  });
  final VoidCallback onTap;
  final IconData icons;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: onTap,
        child: CircleAvatar(
          radius: 14,
          backgroundColor: Colors.grey.shade200,
          child: Icon(icons,color: Colors.grey,size: 16,),
        ),
      ),
    );
  }
}
