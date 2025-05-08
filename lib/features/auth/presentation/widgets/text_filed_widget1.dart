import 'package:flutter/material.dart';

class TextFiledWidget1 extends StatefulWidget {
  final String text;
  final bool obscureText;
  final TextEditingController? textEditingController;
  final Icon? prefixIcon;
  final IconButton? suffixIcon;
  final TextInputType? textInputType;
  final VoidCallback? onTap;
  void Function(String)? onSubmitted;

   TextFiledWidget1({
    super.key,
    this.onSubmitted,
    required this.text,
    this.textEditingController,
    this.prefixIcon,
    this.suffixIcon,
    required this.obscureText,
    this.onTap,
    this.textInputType
  });

  @override
  State<TextFiledWidget1> createState() => _TextFiledWidget1State();
}

class _TextFiledWidget1State extends State<TextFiledWidget1> {
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: _isFocused ? Colors.lightBlue.shade50 : Colors.grey.shade200,
            borderRadius: BorderRadius.circular(12),
          ),
          child: TextField(
            inputFormatters: [],
            keyboardType: widget.textInputType,
            onTap: widget.onTap,
            // readOnly: widget.readOnly,
            focusNode: _focusNode,
            obscureText: widget.obscureText,
            controller: widget.textEditingController,
            onSubmitted: widget.onSubmitted,
            decoration: InputDecoration(
              suffixIcon: widget.suffixIcon,
              hintText: widget.text,
              hintStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.grey.shade400,
              ),
              prefixIcon: widget.prefixIcon,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(12),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.blue, width: 1.5),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
