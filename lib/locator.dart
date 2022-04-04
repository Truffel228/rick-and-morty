import 'package:get_it/get_it.dart';
import 'package:rick_and_morty/services/character/character_service.dart';
import 'package:rick_and_morty/services/character/character_service_interface.dart';
import 'package:rick_and_morty/services/inner_storage/inner_storage_service.dart';
import 'package:rick_and_morty/services/inner_storage/inner_storage_service_interface.dart';

final locator = GetIt.instance;
void setUp() {
  locator
      .registerSingleton<InnerStorageServiceInterface>(InnerStorageService());
  locator.registerLazySingleton<CharacterServiceInterface>(
    () => CharacterService(
      innerStorageService: locator.get<InnerStorageServiceInterface>(),
    ),
  );
}
