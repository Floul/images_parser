import 'dart:async';
import 'package:http/http.dart' show Client;
import 'dart:convert';

import 'package:images_parser/models/image_model.dart';

class ImageApiProvider {
  Client client = Client();
  final _apiAddress =
      'http://api.unsplash.com/photos/?client_id=cf49c08b444ff4cb9e4d126b7e9f7513ba1ee58de7906e4360afc1a33d1bf4c0';

  Future<ImageList> fetchImageList() async {
    final response = await client.get(_apiAddress);
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return ImageList.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
}
