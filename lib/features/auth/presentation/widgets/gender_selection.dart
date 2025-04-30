import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class GenderSelection extends StatefulWidget {
  const GenderSelection({super.key});

  @override
  State<GenderSelection> createState() => _GenderSelectionState();
}

class _GenderSelectionState extends State<GenderSelection> {
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
        hintText: "Gender",
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
      items: ['Male', 'Female', 'Other'].map((String gender) {
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
