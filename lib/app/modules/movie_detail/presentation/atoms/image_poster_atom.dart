import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../shared/utils/string_extensions.dart';
import 'loading_atom.dart';

class ImagePosterAtom extends StatelessWidget {
  final String posterPath;
  const ImagePosterAtom({
    Key? key,
    required this.posterPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      child: CachedNetworkImage(
        imageUrl: posterPath.imageUrlPath(),
        placeholder: (context, url) => const LoadingAtom(),
        errorWidget: (context, url, error) =>
            const Center(child: Icon(Icons.error)),
        height: 130,
        width: 100,
        fit: BoxFit.cover,
      ),
    );
  }
}
