import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ElevetedWidgets extends StatefulWidget {
  ElevetedWidgets({super.key});

  @override
  State<ElevetedWidgets> createState() => _ElevetedWidgetsState();
}

class _ElevetedWidgetsState extends State<ElevetedWidgets> {
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _elevated('🔥 All',38,80,0),SizedBox(width: 10.w,),
        _elevated('💡 3D Design',38,134,1),SizedBox(width: 10.w,),
        _elevated('💰 Business',38,124,2),SizedBox(width: 10.w,),
        _elevated('🎨 Design',38,111,3),SizedBox(width: 10.w,),
      ],
    );
  }

  Widget _elevated(String text, double height, double width, int index) {
    final isSelected = selectedIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(

        height: height,
        width: width,
        decoration: BoxDecoration(
          color: isSelected? Colors.blueAccent:const Color(0xFFFFF5F5),
          border: Border.all(
            color: Colors.blue,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(child: Text(text,style: TextStyle(color: isSelected?Colors.white:Colors.blueAccent),)),
      ),
    );
  }
}
