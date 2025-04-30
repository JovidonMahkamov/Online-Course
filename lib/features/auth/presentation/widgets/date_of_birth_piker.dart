import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class DateOfBirthPicker extends StatefulWidget {
  const DateOfBirthPicker({super.key});

  @override
  State<DateOfBirthPicker> createState() => _DateOfBirthPickerState();
}

class _DateOfBirthPickerState extends State<DateOfBirthPicker> {
  DateTime? selectedDate;
  final TextEditingController _dateController = TextEditingController();
  bool isColor = true;

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
        _dateController.text = picked.toLocal().toString().split(' ')[0];
        isColor =! isColor;
        if(_pickDate == dispose ){
          isColor = true;
        }else{
          isColor = false;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _dateController,
      readOnly: true,
      decoration: InputDecoration(
        hintText: "Date of birth",
        hintStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Colors.grey.shade400,
        ),
        suffixIcon: IconButton(
          icon:  Icon(IconlyLight.calendar, color: isColor? Colors.grey:Colors.black),
          onPressed: _pickDate,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(12),
        ),
        filled: true,
        fillColor:  Colors.grey[200],
      ),
    );
  }
}
