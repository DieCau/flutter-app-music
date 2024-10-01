import 'package:app_music/features/home/domain/entities/recent_entity/recent_home_entity.dart';

abstract class PlayListHomeRepository {
  Future<List<RecentListHomeEntity>> fetchPlayListHome();
}
