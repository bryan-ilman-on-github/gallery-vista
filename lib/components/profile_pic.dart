import 'package:flutter/material.dart';
import 'package:galleryvista/constants/design_tokens.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        width: SideSize.large,
        height: SideSize.large,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/jpgs/bryan.jpg'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
