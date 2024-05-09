import 'package:flutter/material.dart';
import 'package:galleryvista/constants/design_tokens.dart';
import 'package:url_launcher/url_launcher.dart';

class Label extends StatelessWidget {
  final IconData icon;
  final String text;

  const Label({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          icon,
          size: IconSize.small,
          color: AppColor.yellow,
        ),
        const SizedBox(
          width: WhiteSpaceSize.small,
        ),
        GestureDetector(
          onTap: () {
            launchUrl(Uri.parse(text));
          },
          child: Text(
            text,
          ),
        ),
      ],
    );
  }
}
