import 'package:flutter/material.dart';

import '../../../shared/utils/string_extensions.dart';

class ImagePosterAtom extends StatelessWidget {
  final String posterPath;
  const ImagePosterAtom({
    Key? key,
    required this.posterPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      posterPath.imageUrlPath(),
      height: 100,
      width: 90,
      fit: BoxFit.cover,
    );
  }
}
