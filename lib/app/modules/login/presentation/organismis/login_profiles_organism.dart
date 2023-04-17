import 'package:flutter/material.dart';

import '../../domain/entities/user.dart';
import '../molecules/user_profile_item_molecule.dart';

class LoginProfilesOrganism extends StatelessWidget {
  final List<User> listUsersProfiles;
  final void Function(User user) onProfileClick;
  const LoginProfilesOrganism({
    Key? key,
    required this.listUsersProfiles,
    required this.onProfileClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisExtent: 150,
      ),
      itemCount: listUsersProfiles.length,
      itemBuilder: (context, index) {
        final item = listUsersProfiles[index];

        return InkWell(
          onTap: () => onProfileClick(item),
          child: UserProfileItemMolecule(
            imageUrl: item.imagePath,
            userName: item.name,
          ),
        );
      },
    );
  }
}
