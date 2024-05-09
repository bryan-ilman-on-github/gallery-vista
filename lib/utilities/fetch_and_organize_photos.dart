import 'dart:convert';
import 'dart:io';

/// Fetches photos from a given URL and organizes them by album.
///
/// The photos are collected into a buffer, which is passed to `onPhotosCollected`
/// every 10 photos and at the end of the process.
void fetchAndOrganizePhotos({
  Function({required Map<int, List<Map>> photosBuffer})? onPhotosCollected,
}) async {
  const String photosUrl = 'https://jsonplaceholder.typicode.com/photos';

  final HttpClientRequest request = await HttpClient().getUrl(
    Uri.parse(photosUrl),
  );

  final HttpClientResponse response = await request.close();

  if (response.statusCode == 200) {
    final String responseBody = await response.transform(utf8.decoder).join();
    final List photosJson = json.decode(responseBody);

    final Map<int, List<Map>> photosByAlbum = {};

    photosJson.asMap().forEach((index, photoData) {
      int albumId = photoData['albumId'];

      Map photo = {
        'id': photoData['id'],
        'title': photoData['title'],
        'url': photoData['url'],
      };

      photosByAlbum.putIfAbsent(albumId, () => []).add(photo);

      if (index % 10 == 0) {
        onPhotosCollected?.call(photosBuffer: photosByAlbum);
      }
    });

    onPhotosCollected?.call(photosBuffer: photosByAlbum);
  }
}
