import 'package:flutter/material.dart';
import 'package:galleryvista/components/label.dart';
import 'package:galleryvista/components/profile_pic.dart';
import 'package:galleryvista/components/username.dart';
import 'package:galleryvista/constants/design_tokens.dart';

class UserProfile extends StatelessWidget {
  final String name;
  final bool isVerified;
  final String profession;
  final String location;
  final String website;

  const UserProfile({
    super.key,
    required this.name,
    required this.isVerified,
    required this.profession,
    required this.location,
    required this.website,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: PaddingSize.medium,
        vertical: PaddingSize.large,
      ),
      child: Row(
        children: [
          const Align(
            alignment: Alignment.topCenter,
            child: ProfilePicture(),
          ),
          const SizedBox(
            width: WhiteSpaceSize.medium,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Username(name: name, isVerified: isVerified),
                    const Icon(
                      Icons.menu,
                      size: IconSize.large,
                      color: AppColor.green,
                    ),
                  ],
                ),
                Text(
                  profession,
                ),
                const SizedBox(
                  height: WhiteSpaceSize.small,
                ),
                Column(
                  children: [
                    Label(
                      icon: Icons.location_pin,
                      text: location,
                    ),
                    const SizedBox(
                      height: WhiteSpaceSize.small,
                    ),
                    Label(
                      icon: Icons.link,
                      text: website,
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
