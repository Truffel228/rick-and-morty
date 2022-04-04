abstract class InnerStorageServiceInterface{
  Future<void> setEpisodesList(List<String> episodes);
  List<String>? getEpisodesList();
  Future<void> init();
}