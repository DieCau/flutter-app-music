import 'package:app_music/features/home/data/network/datasource/datasource_ntw.dart';
import 'package:app_music/features/home/domain/entities/recent_entity/recent_home_entity.dart';
import 'package:app_music/features/home/domain/repository/playlist_home_repository.dart';

class PlayListHomeRepositoryImpl extends PlayListHomeRepository {
  final DatasourceNtwBdHome datasourceNtwBdHome;

  PlayListHomeRepositoryImpl({
    required this.datasourceNtwBdHome,
  });
  @override
  Future<List<RecentListHomeEntity>> fetchPlayListHome() async {
    final response = await datasourceNtwBdHome.fetchPlayList();
    final dataMap = response.map((e) {
      return RecentListHomeEntity.fromModelDb(e);
    }).toList();
    return dataMap;
  }
}
