import 'package:flutter/material.dart';

import '../../domain/entities/movie.dart';
import '../atoms/image_header_atom.dart';
import '../atoms/like_button_atom.dart';
import '../molecules/header_likes_info_molecule.dart';

class MovieHeaderOrganism extends StatelessWidget {
  final Movie? movie;
  final bool isLiked;
  final VoidCallback onLikeButtonTap;
  const MovieHeaderOrganism({
    Key? key,
    required this.movie,
    required this.isLiked,
    required this.onLikeButtonTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (movie?.posterPath.isNotEmpty == true)
          ImageHeaderAtom(
            imagePath: movie!.posterPath,
          ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      movie!.originalTitle,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                      ),
                    ),
                  ),
                  LikeButtonAtom(
                    isLiked: isLiked,
                    onButttonTap: onLikeButtonTap,
                  ),
                ],
              ),
              HeaderLikesInfoMolecule(voteCount: movie!.voteCount),
            ],
          ),
        ),
      ],
    );
  }
}
