import 'package:login_app/services/unsplash_service.dart';

class ImageRepository {
  final _unsplashService = UnsplashService();

  getImage(query) {
    return _unsplashService.makeRequest(query);
  }
}
