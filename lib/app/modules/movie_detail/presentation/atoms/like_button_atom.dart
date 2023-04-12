import 'package:flutter/material.dart';

class LikeButtonAtom extends StatelessWidget {
  final bool isLiked;
  final VoidCallback onButttonTap;

  const LikeButtonAtom({
    super.key,
    required this.isLiked,
    required this.onButttonTap,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(isLiked ? Icons.favorite : Icons.favorite_outline),
      onPressed: () => {
        onButttonTap(),
      },
    );
  }
}
