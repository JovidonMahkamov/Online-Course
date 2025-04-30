import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../../../../core/route/route_names.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25,right: 25),
      child: TextField(
        onTap: (){Navigator.pushNamed(context, RouteNames.homeSearchPage);},
        readOnly: true,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey[200],
          suffixIcon: IconButton(onPressed: (){}, icon: const Icon(IconlyLight.filter)),
          hintText: 'Search',
          hintStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Colors.grey.shade400,
          ),
          prefixIcon: Icon(IconlyLight.search,color: Colors.grey[500],),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent, width: 1.5),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        style: const TextStyle(
          fontSize: 16,
          color: Colors.black,
        ),
      ),
    );
  }
}
