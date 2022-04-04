import 'package:rick_and_morty/models/character/character/character.dart';
import 'package:rick_and_morty/repositories/character/character_repository_interface.dart';
import 'package:rick_and_morty/services/character/character_service_interface.dart';

class CharacterRepository implements CharacterRepositoryInterface {
  CharacterRepository({required CharacterServiceInterface characterService})
      : _characterService = characterService;
  final CharacterServiceInterface _characterService;
  @override
  Future<List<Character>> getCharacters(int page) async {
    try {
      final apiList = await _characterService.getCharacterApiList(page);
      final characterList = await _characterService.charactersFromApiToModel(apiList);
      return characterList;
    } catch (e) {
      throw Exception(e);
    }
  }
}
