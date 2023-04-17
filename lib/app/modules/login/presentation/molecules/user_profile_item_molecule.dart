import 'package:flutter/material.dart';

import '../atoms/user_picture_atom.dart';

class UserProfileItemMolecule extends StatelessWidget {
  final String imageUrl;
  final String userName;
  const UserProfileItemMolecule({
    Key? key,
    required this.imageUrl,
    required this.userName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UserPictureAtom(
          imageUrl: imageUrl,
        ),
        Text(
          userName,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}
