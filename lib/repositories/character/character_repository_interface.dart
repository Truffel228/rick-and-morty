import 'package:rick_and_morty/models/character/character/character.dart';

abstract class CharacterRepositoryInterface{
  Future<List<Character>> getCharacters(int page);
}