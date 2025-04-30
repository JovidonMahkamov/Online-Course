import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContainerWidgets extends StatefulWidget {
  final String text;
  final IconData icon;
  final IconData icon1;
  final VoidCallback onTab;


  const ContainerWidgets(
      {super.key, required this.text, required this.icon, required this.icon1, required this.onTab,});

  @override
  State<ContainerWidgets> createState() => _ContainerWidgetsState();
}

class _ContainerWidgetsState extends State<ContainerWidgets> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTab,
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(widget.icon),
                SizedBox(
                  width: 20.w,
                ),
                Text(
                  widget.text,
                  style: TextStyle(fontSize: 18.sp),
                ),
              ],
            ),
            // Text(widget.language,style: TextStyle(fontSize: 18.sp),),
            SizedBox(width: 25.w,),
            Icon(widget.icon1),
          ],
        ),
      ),
    );
  }
}
