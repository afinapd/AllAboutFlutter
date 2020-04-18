import 'package:login_app/constants/api_key.dart';
import 'package:login_app/services/base_service.dart';

class UnsplashService extends BaseService {
  makeRequest(query) async {
    try {
      final response = await dio.get('/search/photos',
          queryParameters: {'query': query, 'client_id': UNSPLASH_ACCESS_KEY});
      final img = response.data;
      return img['results'];
    } on Exception catch (e) {
      // TODO
      return [];
    }
  }
}
