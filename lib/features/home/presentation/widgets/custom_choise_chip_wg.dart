import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class CustomChoiceChipWg extends StatelessWidget {
  final int selectedIndex;
  final int index;
  final String label;
  final bool showIcon;
  final void Function(bool)? onSelected;

  const CustomChoiceChipWg({
    super.key,
    required this.index,
    required this.label,
    required this.selectedIndex,
    required this.onSelected,
    this.showIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: (12)),
      child: ChoiceChip(
        label: Text(
          label,
          style: TextStyle(
            color:
            selectedIndex == index ? Colors.white : Colors.blue,
            fontSize: 16,
          ),
        ),
        selected: selectedIndex == index,
        selectedColor: Colors.blue,
        backgroundColor: Colors.white,
        showCheckmark: false,
        avatar: showIcon
            ? Icon(
          IconlyBold.star,
          color: selectedIndex == index
              ? Colors.white
              : Colors.blue,
        )
            : null,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.blue,),
          borderRadius: BorderRadius.circular(100),
        ),
        onSelected: onSelected,
      ),
    );
  }
}
