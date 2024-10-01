import 'package:app_music/features/playlist/data/network/datasource_ntw.dart';
import 'package:app_music/features/playlist/domain/entities/playlist_entity.dart';
import 'package:app_music/features/playlist/domain/repositories/playlist_screen_repository.dart';

class PlayListScreenRepositorImpl extends PlaylistScreenRepository {
  final DatasourcePlayListNtwDb datasourcePlayListNtwDb;

  PlayListScreenRepositorImpl({required this.datasourcePlayListNtwDb});
  @override
  Future<PlayListEntity> fetPlayList() async {
    final response = await datasourcePlayListNtwDb.fetPlayList();
    final object = PlayListEntity.fromModelDb(response);
    return object;
  }
}
