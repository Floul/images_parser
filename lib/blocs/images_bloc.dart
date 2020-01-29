import 'package:images_parser/models/image_model.dart';

import '../resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class ImagesBloc {
  final _repository = Repository();
  final _imagesFetcher = PublishSubject<ImageList>();

  Observable<ImageList> get allImages => _imagesFetcher.stream;

  fetchAllMovies() async {
    ImageList itemModel = await _repository.fetchAllImages();
    _imagesFetcher.sink.add(itemModel);
  }

  dispose() {
    _imagesFetcher.close();
  }
}

final bloc = ImagesBloc();
