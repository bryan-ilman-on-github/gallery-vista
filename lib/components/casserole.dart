import 'package:flutter/material.dart';
import 'package:galleryvista/components/album_cover.dart';
import 'package:galleryvista/components/album_title.dart';

class Casserole extends StatefulWidget {
  final Function? onSelected;
  final Map<int, List<Map>> photosByAlbum;

  const Casserole({
    super.key,
    required this.onSelected,
    required this.photosByAlbum,
  });

  @override
  State createState() => _CasseroleState();
}

class _CasseroleState extends State<Casserole> {
  final PageController _pageController = PageController(
    viewportFraction: 0.6, // this number is arbitrary
  );

  int _selectedAlbumId = 1;

  @override
  void initState() {
    super.initState();

    _pageController.addListener(() {
      final int index = _pageController.page?.round() ?? 0;
      final int selectedAlbumId = index + 1;

      // Only proceed if the selected album ID has changed
      if (_selectedAlbumId != selectedAlbumId) {
        setState(() {
          _selectedAlbumId = selectedAlbumId;
        });

        // Notify the parent widget about the selected album ID
        widget.onSelected?.call(selectedAlbumId);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pageController,
      pageSnapping: false,
      physics: const BouncingScrollPhysics(),
      itemCount: 10, // there are 10 albums
      itemBuilder: (context, index) {
        int albumId = index + 1;

        return AnimatedBuilder(
          animation: _pageController,
          builder: (context, child) {
            if (!_pageController.position.haveDimensions) {
              return Container(); // return an empty container while waiting for content
            }

            final currentPage = _pageController.page ?? 0.0;
            final pageDiff = index - currentPage + 0.2; // shifted towards left.

            // these calculations are done arbitrarily adjusting to the design
            final double scaleFactor = (pageDiff.abs() * 0.2).clamp(0.0, 0.2);
            final double opacityFactor =
                (1 - pageDiff.abs() * 4).clamp(0.0, 1.0);

            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12.0,
              ),
              child: Stack(
                children: [
                  Opacity(
                    opacity: opacityFactor,
                    child: AlbumTitle(
                      title: widget.photosByAlbum[albumId]?[0]['title'],
                    ),
                  ),
                  Transform(
                    transform: Matrix4.identity()
                      ..scale(1.0, 1.0 - scaleFactor, 1.0),
                    alignment: Alignment.center,
                    child: AlbumCover(
                      url: widget.photosByAlbum[albumId]?[0]['url'],
                      isSelected: pageDiff > 0.0,
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
