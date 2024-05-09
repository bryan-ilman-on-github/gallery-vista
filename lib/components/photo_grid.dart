import 'dart:math';

import 'package:flutter/material.dart';
import 'package:galleryvista/components/photo.dart';
import 'package:galleryvista/constants/design_tokens.dart';

class PhotoGrid extends StatefulWidget {
  final List<Map> photos;

  const PhotoGrid({
    super.key,
    required this.photos,
  });

  @override
  State createState() => _PhotoGridState();
}

class _PhotoGridState extends State<PhotoGrid> {
  final ScrollController _scrollController = ScrollController();
  late int _displayedPhotoCount;

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _loadMorePhotos();
      }
    });

    _displayedPhotoCount = min(widget.photos.length, 20);
  }

  void _loadMorePhotos() {
    setState(() {
      final remainingPhotosCount = widget.photos.length - _displayedPhotoCount;
      _displayedPhotoCount += min(remainingPhotosCount, 20);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: PaddingSize.small),
      controller: _scrollController,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: MarginSize.small,
        crossAxisSpacing: MarginSize.small,
      ),
      physics: const BouncingScrollPhysics(),
      itemCount: _displayedPhotoCount,
      itemBuilder: (context, index) {
        return Photo(
          url: widget.photos[index]['url'],
        );
      },
    );
  }
}
