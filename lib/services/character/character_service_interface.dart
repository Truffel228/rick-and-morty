import 'package:rick_and_morty/models/character/character/character.dart';
import 'package:rick_and_morty/models/character/character_api/character_api.dart';

abstract class CharacterServiceInterface{
  Future<List<CharacterApi>> getCharacterApiList(int page);
  Future<List<Character>> charactersFromApiToModel(List<CharacterApi> apiList);
}