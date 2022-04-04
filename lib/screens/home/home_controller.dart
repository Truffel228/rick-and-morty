import 'package:get/get.dart';
import 'package:rick_and_morty/models/character/character/character.dart';
import 'package:rick_and_morty/repositories/character/character_repository_interface.dart';

class HomeController extends GetxController {
  HomeController({required CharacterRepositoryInterface characterRepository})
      : _characterRepository = characterRepository;
  final CharacterRepositoryInterface _characterRepository;
  List<Character> characterList = <Character>[];
  bool isError = false;
  bool isLoadingMore = false;
  int _page = 1;
  bool endOfList = false;

  @override
  void onInit() async {
    super.onInit();
    characterList = await _characterRepository.getCharacters(_page);
    _page++;
    update();
  }

  void loadMore() async {
    try {
      if (!isLoadingMore && !endOfList) {
        isLoadingMore = true;
        update();
        final list = await _characterRepository.getCharacters(_page);
        _page++;
        if(list.isNotEmpty){
          characterList.addAll(list);
        } else{
          endOfList = true;
        }
        isLoadingMore = false;
        update();
      }
    } catch (e) {
        isError = true;
      update();
    }
  }
}
