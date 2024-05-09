import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:galleryvista/constants/design_tokens.dart';
import 'package:galleryvista/views/albums_page.dart';

void main() => runApp(const GalleryVista());

class GalleryVista extends StatelessWidget {
  const GalleryVista({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    return MaterialApp(
      title: 'GalleryVista',
      theme: ThemeData(
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            fontFamily: 'Poppins',
            overflow: TextOverflow.ellipsis,
            letterSpacing: 0.4,
            fontSize: TextSize.medium,
            color: AppColor.moderateGray,
          ),
        ),
      ),
      home: const AlbumsPage(),
    );
  }
}
