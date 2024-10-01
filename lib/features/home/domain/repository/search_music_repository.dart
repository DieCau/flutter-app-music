import 'package:app_music/features/home/domain/entities/search_entity/search_home_search_entity.dart';

abstract class SearchMusicRepository {
  Stream<List<SearchHomeEntity>> searchMusic({required String request});
}
