import 'package:flutter/material.dart';
import 'package:galleryvista/constants/design_tokens.dart';

class Username extends StatelessWidget {
  final String name;
  final bool isVerified;

  const Username({
    super.key,
    required this.name,
    required this.isVerified,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          name,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: TextSize.large,
                color: AppColor.heavyGray,
              ),
        ),
        const SizedBox(
          width: WhiteSpaceSize.small,
        ),
        if (isVerified)
          const Icon(
            Icons.check_circle,
            size: IconSize.medium,
            color: AppColor.green,
          ),
      ],
    );
  }
}
