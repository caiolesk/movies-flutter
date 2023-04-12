import 'package:flutter/material.dart';

class HeaderLikesInfoMolecule extends StatelessWidget {
  final int voteCount;
  const HeaderLikesInfoMolecule({
    Key? key,
    required this.voteCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.favorite),
        const SizedBox(width: 5),
        Text('$voteCount Likes'),
      ],
    );
  }
}
