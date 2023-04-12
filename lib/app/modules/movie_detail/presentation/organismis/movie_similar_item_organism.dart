import 'package:flutter/material.dart';

import '../atoms/image_poster_atom.dart';
import '../molecules/movie_similar_information_molecule.dart';

class MovieSimilarItemOrganism extends StatelessWidget {
  final String posterPath;
  final String title;
  final String releaseDate;
  const MovieSimilarItemOrganism({
    Key? key,
    required this.posterPath,
    required this.title,
    required this.releaseDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(),
      child: Row(
        children: [
          ImagePosterAtom(posterPath: posterPath),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MovieSimilarInformationMolecule(
              title: title,
              releaseDate: releaseDate.split('-').first,
            ),
          ),
        ],
      ),
    );
  }
}
