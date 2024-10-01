import 'package:app_music/features/home/domain/entities/favority_entity/your_favorite_music_entity.dart';

class DatasourceMemorydbHome {
  Future<void> addFavoriteMusic({required YourFavoriteMusicEntity model}) async {
    if (!musicProvider.contains(model)) {
      musicProvider.add(model);
    } else {}
  }

  Future<void> remodeTrack({required int id}) async {
    try {
      musicProvider.removeWhere((element) => element.id == id);
    } catch (e) {
      rethrow;
    }
  }

  Future<List<YourFavoriteMusicEntity>> fetchAllFavoriteMusic() async {
    return musicProvider;
  }
}

final List<YourFavoriteMusicEntity> musicProvider = [];
