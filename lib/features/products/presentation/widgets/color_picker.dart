import 'package:flutter/material.dart';
class ColorPicker extends StatefulWidget {
  const ColorPicker({super.key, required this.colors, required this.onSelected});
   final List<Color> colors;
   final Function(Color) onSelected;
  @override
  State<ColorPicker> createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  Color? _selectedColor;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        spacing: 8,
        children: widget.colors.map((color){
          final isSelected = _selectedColor == color;
           return GestureDetector(
             onTap: (){
               _selectedColor = color;
               widget.onSelected(color);
               setState(() {});
             },
             child: CircleAvatar(
               backgroundColor: color,
               child: isSelected ? Icon(Icons.check,color: Colors.white,) : null
             ),
           );
        }
        ).toList()

      ),
    );
  }
}
