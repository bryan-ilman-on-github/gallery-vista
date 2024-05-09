import 'package:flutter/material.dart';
import 'package:galleryvista/constants/design_tokens.dart';

/// The cover is an image that is fetched from the network.
/// If the image URL is not available, an icon is displayed instead.
class AlbumCover extends StatelessWidget {
  final String? url;
  final bool isSelected;

  const AlbumCover({
    super.key,
    required this.url,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 64, // this number is arbitrary
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(CurvatureSize.large),
        child: url == null
            ? const Icon(
                Icons.no_photography,
                color: Colors.white,
              )
            : Image.network(
                url!,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
      ),
    );
  }
}
