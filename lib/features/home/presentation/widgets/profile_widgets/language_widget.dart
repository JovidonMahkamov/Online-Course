import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LanguageWidget extends StatefulWidget {
  final int index;
  final String text;
  const LanguageWidget({super.key,required this.index,required this.text});

  @override
  State<LanguageWidget> createState() => _LanguageWidgetState();
}

class _LanguageWidgetState extends State<LanguageWidget> {
  int? selectedIndex;
  @override
  Widget build(BuildContext context) {
    final isSelected = selectedIndex== widget.index;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(widget.text,style: TextStyle(fontSize: 18.sp),),
        GestureDetector(
          onTap: (){
            setState(() {
              selectedIndex = widget.index;
            });
          },
          child: isSelected ? Container(
            width: 25,
            height: 25,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              border: Border.all(
                color: Color(0xff335EF7),
                width: 3,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
          ):Container(
          width: 22,
          height: 22,
          decoration: BoxDecoration(
            color: Colors.blueAccent,
            border: Border.all(
              color: Colors.grey,
              width: 3,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
        )
        ),
      ],
    );
  }
}
