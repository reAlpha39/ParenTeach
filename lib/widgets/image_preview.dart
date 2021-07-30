import 'package:flutter/material.dart';

class ImagePreview extends StatelessWidget {
  final String? pathPicture;

  const ImagePreview({Key? key, this.pathPicture}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: pathPicture != "" && pathPicture != null
          ? ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(17),
              ),
              child: Image.network(
                pathPicture!,
                loadingBuilder: (context, child, progress) {
                  return progress == null ? child : LinearProgressIndicator();
                },
                fit: BoxFit.cover,
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Foto saat ini',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black54,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
    );
  }
}
