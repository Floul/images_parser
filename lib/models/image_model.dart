class ImageList {
  final List<ImageModel> images;

  ImageList({this.images});

  factory ImageList.fromJson(List<dynamic> parsedJson) {
    List<ImageModel> images = new List<ImageModel>();
    images = parsedJson.map((i) => ImageModel.fromJson(i)).toList();
    return ImageList(images: images);
  }
}

class ImageModel {
  final Urls urls;
  final User user;

  ImageModel({this.user, this.urls});

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    Urls urls = Urls.fromJson(json['urls']);
    User user = User.fromJson(json['user']);
    return ImageModel(urls: urls, user: user);
  }
}

class User {
  final String name;

  User({this.name});

  factory User.fromJson(Map<String, dynamic> json) {
    String name = json['name'];
    return User(name: name);
  }
}

class Urls {
  final String raw;
  final String thumb;
  final String regular;

  Urls({this.thumb, this.regular, this.raw});

  factory Urls.fromJson(Map<String, dynamic> json) {
    return Urls(
        thumb: json['thumb'], regular: json['regular'], raw: json['raw']);
  }
}
