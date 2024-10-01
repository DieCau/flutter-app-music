import 'package:app_music/features/home/domain/entities/favority_entity/your_favorite_music_entity.dart';

abstract class FavoriteMusicRepository {
  Future<void> addFavoriteMusic({required YourFavoriteMusicEntity model});
  Future<List<YourFavoriteMusicEntity>> fetchAllFavoriteMusic();
  Future<void> removeFavorite({required int id});
}
