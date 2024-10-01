import 'package:app_music/features/playlist/domain/entities/playlist_entity.dart';

abstract class PlaylistScreenRepository {
  Future<PlayListEntity> fetPlayList();
}
