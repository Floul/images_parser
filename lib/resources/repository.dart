import 'dart:async';
import 'package:images_parser/models/image_model.dart';
import 'package:images_parser/resources/images_api_provider.dart';

class Repository {
  final moviesApiProvider = ImageApiProvider();

  Future<ImageList> fetchAllImages() => moviesApiProvider.fetchImageList();
}
