import 'package:flutter/material.dart';
import 'package:galleryvista/constants/design_tokens.dart';

/// The title is displayed in a container with a rounded border.
/// If the title is not available, a circular progress indicator is displayed instead.
class AlbumTitle extends StatelessWidget {
  final String? title;

  const AlbumTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        right: 0.8, // this number is arbitrary
        left: 0.8, // this number is arbitrary
        top: MarginSize.large,
        bottom: MarginSize.medium,
      ),
      padding: const EdgeInsets.all(PaddingSize.small),
      decoration: BoxDecoration(
        color: AppColor.yellow,
        boxShadow: [Shadow.yellow],
        borderRadius: BorderRadius.circular(CurvatureSize.large),
      ),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: title == null
            ? const SizedBox(
                width: SideSize.small,
                height: SideSize.small,
                child: CircularProgressIndicator(
                  strokeWidth: 2.0,
                  color: Colors.white,
                ),
              )
            : Text(
                title!,
                maxLines: 2,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.white,
                    ),
              ),
      ),
    );
  }
}
