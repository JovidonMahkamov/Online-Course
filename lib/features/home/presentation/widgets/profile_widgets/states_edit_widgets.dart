import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class StatesEditWidgets extends StatefulWidget {
  const StatesEditWidgets({super.key});

  @override
  State<StatesEditWidgets> createState() => _StatesEditWidgetsState();
}

class _StatesEditWidgetsState extends State<StatesEditWidgets> {
  String? selectGender;
  bool isColor = true;
  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
    isColor =! isColor;
    if(selectGender == isColor){
      isColor = true;
    }else{
      isColor = false;
    }
  }


  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      icon: Icon(IconlyBold.arrow_down_2 , color: isColor? Colors.grey : Colors.black),
      value: selectGender,
      decoration: InputDecoration(
        hintText: "State",
        hintStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Colors.grey.shade400,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(12),
        ),
        filled: true,
        fillColor:  Colors.grey[200],
      ),
      items: ['Uzbekistan', 'Russia', 'United State','Tajikistan'].map((String gender) {
        return DropdownMenuItem(
          value: gender,
          child: Text(
            gender,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          selectGender = value;
        });
      },
    );
  }
}
