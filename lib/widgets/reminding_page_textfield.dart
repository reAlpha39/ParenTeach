import 'package:flutter/material.dart';
import 'package:parenteach/utils/utils.dart';

class RemindingPageTextField extends StatelessWidget {
  const RemindingPageTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: InputBorder.none,
        prefixIcon: Icon(
          Icons.search,
          color: pinkColor,
        ),
        suffixIcon: Icon(Icons.arrow_drop_down),
        fillColor: Colors.white,
        filled: true,
        labelText: 'Search',
        labelStyle: blackText.copyWith(color: Colors.grey),
      ),
    );
  }
}
