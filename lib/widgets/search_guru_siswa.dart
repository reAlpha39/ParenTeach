import 'package:flutter/material.dart';
import 'package:parenteach/utils/utils.dart';

class SearchGuruSiswa extends StatelessWidget {
  final TextEditingController? cariController;
  final String? textFieldLabel;

  const SearchGuruSiswa({Key? key, this.cariController, this.textFieldLabel})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 37,
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              style: blackText.copyWith(
                fontSize: 14,
              ),
              controller: cariController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                labelText: textFieldLabel,
                labelStyle: blackText.copyWith(fontSize: 12),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          ElevatedButton(
            style: ButtonStyle(
              elevation: MaterialStateProperty.all<double>(0),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  'Simpan',
                  style: whiteText.copyWith(fontSize: 12),
                ),
              ),
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
