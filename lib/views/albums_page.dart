import 'package:flutter/material.dart';
import 'package:galleryvista/components/casserole.dart';
import 'package:galleryvista/components/photo_grid.dart';
import 'package:galleryvista/components/user_profile.dart';
import 'package:galleryvista/constants/design_tokens.dart';
import 'package:galleryvista/utilities/fetch_and_organize_photos.dart';

class AlbumsPage extends StatefulWidget {
  const AlbumsPage({super.key});

  @override
  State<AlbumsPage> createState() => _AlbumsPageState();
}

class _AlbumsPageState extends State<AlbumsPage> {
  // Here is some user information that has been hardcoded according to the provided design.
  String name = "Bryan 'Ilman";
  bool isVerified = true;
  String profession = 'Full Stack Developer';
  String location = 'Jakarta, Indonesia';
  String linkedinURL = 'https://www.linkedin.com/in/bryan-ilman';

  int _selectedAlbumId = 1;
  final Map<int, List<Map>> _photosByAlbum = {};

  @override
  void initState() {
    super.initState();
    fetchAndOrganizePhotos(
      onPhotosCollected: ({required photosBuffer}) => setState(() {
        _photosByAlbum.addAll(photosBuffer);
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: UserProfile(
                  name: name,
                  isVerified: isVerified,
                  profession: profession,
                  location: location,
                  website: linkedinURL,
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  padding: EdgeInsets.only(
                    top: screenWidth / 4,
                  ),
                  color: AppColor.lightGray,
                  child: _photosByAlbum[_selectedAlbumId] == null
                      ? null
                      : PhotoGrid(photos: _photosByAlbum[_selectedAlbumId]!),
                ),
              ),
            ],
          ),
          Column(
            children: [
              const Spacer(flex: 4),
              SizedBox(
                width: screenWidth,
                height: screenWidth / 2,
                child: Casserole(
                  photosByAlbum: _photosByAlbum,
                  onSelected: (selectedAlbumId) {
                    setState(() {
                      _selectedAlbumId = selectedAlbumId;
                    });
                  },
                ),
              ),
              const Spacer(flex: 12),

              // this is for fading effect
              Container(
                decoration: BoxDecoration(
                  boxShadow: [Shadow.white],
                ),
                width: double.infinity,
              ),
            ],
          ),

          // this is the page number
          Positioned(
            top: screenHeight / 2.8, // this number is arbitrary
            right: screenWidth / 8, // this number is arbitrary
            child: Text('$_selectedAlbumId of 10'),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () {},
        backgroundColor: AppColor.red,
        child: const Icon(
          Icons.add,
          size: IconSize.medium,
          color: Colors.white,
        ),
      ),
    );
  }
}
