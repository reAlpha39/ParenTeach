import 'package:flutter/material.dart';
import 'package:parenteach/utils/theme.dart';

class LoginTextField extends StatelessWidget {
  final TextEditingController? _textEditingController;
  final String? labelText;
  final String? returnError;
  final bool isObsecure;
  final bool? isCrl;

  const LoginTextField({
    Key? key,
    required TextEditingController? textEditingController,
    this.labelText,
    this.returnError,
    this.isObsecure = false,
    this.isCrl = false,
  })  : _textEditingController = textEditingController,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: blackText.copyWith(
        fontSize: 14,
      ),
      controller: _textEditingController,
      obscureText: isObsecure,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        labelText: labelText,
      ),
    );
  }
}
