import 'package:rick_and_morty/services/inner_storage/inner_storage_service_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InnerStorageService implements InnerStorageServiceInterface {
  late final SharedPreferences _preferences;
  static const String _episodesListKey = 'episodedKey';

  @override
  List<String>? getEpisodesList() {
    return _preferences.getStringList(_episodesListKey);
  }

  @override
  Future<void> setEpisodesList(List<String> episodes) async {
    await _preferences.setStringList(_episodesListKey, episodes);
  }

  @override
  Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }
}
