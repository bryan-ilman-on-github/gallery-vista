import 'package:flutter/material.dart';
import 'package:galleryvista/constants/design_tokens.dart';

class Photo extends StatelessWidget {
  final String url;

  const Photo({
    super.key,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(CurvatureSize.small),
      ),
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(CurvatureSize.small),
          child: Image.network(
            url,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
