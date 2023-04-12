import 'package:flutter/material.dart';

class MovieSimilarInformationMolecule extends StatelessWidget {
  final String title;
  final String releaseDate;
  const MovieSimilarInformationMolecule({
    Key? key,
    required this.title,
    required this.releaseDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        Text(releaseDate),
      ],
    );
  }
}
