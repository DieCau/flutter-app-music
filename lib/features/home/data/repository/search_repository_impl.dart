import 'package:app_music/features/home/data/network/datasource/datasource_ntw.dart';
import 'package:app_music/features/home/domain/entities/search_entity/search_home_search_entity.dart';
import 'package:app_music/features/home/domain/repository/search_music_repository.dart';

class SearchRepositoryImpl extends SearchMusicRepository {
  final DatasourceNtwBdHome datasourceNtwBdHome;

  SearchRepositoryImpl({required this.datasourceNtwBdHome});
  @override
  Stream<List<SearchHomeEntity>> searchMusic({required String request}) async* {
    try {
      await for (final response in datasourceNtwBdHome.searchMusic(request: request.trim())) {
        final entities = response.map((model) => SearchHomeEntity.fromModel(model)).toList();
        yield entities;
      }
    } catch (e) {
      yield* Stream.error('Failed to fetch search results');
    }
  }
}
