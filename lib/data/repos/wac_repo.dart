import 'package:wac_test/data/models/profile_model.dart';
import 'package:wac_test/error/failures.dart';
import 'package:wac_test/network/http_client.dart';
import 'package:wac_test/network/urls.dart';

class WacRepository {
  WacRepository._internal();

  WacHttpClient _wacHttpClient = WacHttpClient();

  static final WacRepository _instance = WacRepository._internal();

  factory WacRepository() {
    return _instance;
  }

  Future<List<Profile>> getProfile() async {
    try {
      final res = await _wacHttpClient.get(urlPath: Urls.WAC_URL);
      print(res);
      return List<Profile>.from(res.data.map((e) => Profile.fromJson(e)));
    } catch (e) {
      print(e);
      throw ApiError(message: e.toString());
    }
  }
}