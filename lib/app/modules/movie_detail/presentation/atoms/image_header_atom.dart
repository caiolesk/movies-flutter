import 'package:flutter/material.dart';

import '../../../shared/utils/string_extensions.dart';

class ImageHeaderAtom extends StatelessWidget {
  final String imagePath;
  const ImageHeaderAtom({
    Key? key,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (rect) {
        return const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.black, Colors.transparent],
        ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
      },
      blendMode: BlendMode.dstIn,
      child: Image.network(
        imagePath.imageUrlPath(),
        height: 300,
        fit: BoxFit.cover,
      ),
    );
  }
}
