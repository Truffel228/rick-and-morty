import 'package:dio/dio.dart';
import 'package:rick_and_morty/models/character/character/character.dart';
import 'package:rick_and_morty/models/character/character_api/character_api.dart';
import 'package:rick_and_morty/services/character/character_service_interface.dart';
import 'package:rick_and_morty/enum/gender_enum.dart';
import 'package:rick_and_morty/enum/status_enum.dart';
import 'package:rick_and_morty/services/inner_storage/inner_storage_service_interface.dart';

class CharacterService implements CharacterServiceInterface {
  CharacterService({required InnerStorageServiceInterface innerStorageService})
      : _innerStorageService = innerStorageService;
  final InnerStorageServiceInterface _innerStorageService;
  final Dio dio = Dio(
    BaseOptions(baseUrl: 'https://rickandmortyapi.com/api'),
  );
  @override
  Future<List<Character>> charactersFromApiToModel(
      List<CharacterApi> apiList) async {
    // if (_innerStorageService.getEpisodesList() == null) {
    //   await _innerStorageService.setEpisodesList(await _getAllEpisodesNames());
    // }
    final List<String> allEpisodesNames = await _getAllEpisodesNames();
    final characterList = <Character>[];
    try {
      for (final api in apiList) {
        final episodeNames = <String>[];

        for (final episode in api.episode) {
          int episodeNumber;
          /// Если на конце двузначное число, парсим последних 2 символа, если нет, парсим последний смвол
          if(int.tryParse(episode.substring(episode.length - 2)) != null){
            episodeNumber = int.parse(episode.substring(episode.length - 2)) - 1;
          } else{
            episodeNumber = int.parse(episode.substring(episode.length - 1)) - 1;
          }

          /// Номера эпизодов идут от 1 и до последнего, но у нас в списке [allEpisodesNames]
          /// номера эпизодов идут с нуля
          final String episodeName = allEpisodesNames[episodeNumber];
          episodeNames.add(episodeName);
        }

        final character = Character(
            name: api.name,
            episodeNames: episodeNames,
            gender: _getGender(api.gender)!,
            status: _getStatus(api.status)!,
            imageUrl: api.image);
        characterList.add(character);
      }
      return characterList;
    } catch (e) {
      print(e);
      throw Exception(e);
    }
  }

  Gender? _getGender(String genderString) {
    switch (genderString) {
      case 'Female':
        return Gender.female;
      case 'Male':
        return Gender.male;
      case 'Genderless':
        return Gender.genderless;
      case 'unknown':
        return Gender.unknown;
    }
    return null;
  }

  Status? _getStatus(String statusString) {
    switch (statusString) {
      case 'Alive':
        return Status.alive;
      case 'Dead':
        return Status.dead;
      case 'unknown':
        return Status.unknown;
    }
    return null;
  }

  @override
  Future<List<CharacterApi>> getCharacterApiList(int page) async {
    try {
      final Response response = await dio.get('/character/?page=$page');
      final data = response.data;
      final list = data['results'] as List<dynamic>;
      final characterApiList =
          list.map((jsonObj) => CharacterApi.fromJson(jsonObj)).toList();
      return characterApiList;
    } on DioError catch (e) {
      if(e.response!.statusCode == 404 && e.response!.statusMessage == 'Not Found'){
        print(e);
        return [];
      }
      print(e);
      throw Exception(e);
    }
  }

  /// В документации к API ничего нет об эндпоинте со списком ВСЕХ эпизодов,
  /// придёться получать их по странично при помощи цикла
  Future<List<String>> _getAllEpisodesNames() async {
    final allEpisodesList = <String>[];
    try {
      for(var pageOfEpisodes = 1; pageOfEpisodes < 4; pageOfEpisodes++){
        final Response response = await dio.get('/episode?page=$pageOfEpisodes');
        final data = response.data as Map<String, dynamic>;
        final list = data['results'] as List<dynamic>;
        final episodesListForPage =
        list.map((episode) => episode['name'] as String).toList();
        allEpisodesList.addAll(episodesListForPage);
      }
      return allEpisodesList;
    } catch (e) {
      print(e);
      throw Exception(e);
    }
  }
}
