import 'package:flutter/material.dart';

import '../../../movie_detail/presentation/atoms/loading_atom.dart';
import '../../../shared/constants/app_margins.dart';
import '../../domain/entities/user.dart';
import '../../login_strings.dart';
import '../organismis/login_profiles_organism.dart';

class LoginTemplate extends StatelessWidget {
  final List<User> listUsersProfiles;
  final bool isLoading;
  final void Function(User user) onProfileClick;
  const LoginTemplate({
    Key? key,
    required this.listUsersProfiles,
    required this.isLoading,
    required this.onProfileClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: isLoading
              ? const LoadingAtom()
              : Column(
                  children: [
                    Image.asset('assets/images/login_logo.png'),
                    const SizedBox(height: kMarginBig * 2),
                    Text(
                      LoginStrings.profiles.title,
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: kMarginMedium),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 60,
                          right: 60,
                        ),
                        child: LoginProfilesOrganism(
                          listUsersProfiles: listUsersProfiles,
                          onProfileClick: onProfileClick,
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
