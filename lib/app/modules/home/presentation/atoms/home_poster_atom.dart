import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../movie_detail/presentation/atoms/loading_atom.dart';

class HomePosterAtom extends StatelessWidget {
  final String imageUrl;
  const HomePosterAtom({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(
        Radius.circular(15),
      ),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        placeholder: (context, url) => const LoadingAtom(),
        width: 150,
        fit: BoxFit.cover,
      ),
    );
  }
}
