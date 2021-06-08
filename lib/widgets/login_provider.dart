import 'package:flutter/material.dart';

class LoginProvider extends StatelessWidget {
  final String? imageAsset;
  const LoginProvider({
    Key? key,
    this.imageAsset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {},
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Color(0xffF1F3F6),
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image.asset(imageAsset!),
          ),
        ),
      ),
    );
  }
}
