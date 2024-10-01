import 'package:app_music/features/home/data/network/model/playlist_model/playlist_model_db.dart';
import 'package:app_music/features/playlist/domain/entities/track_entity.dart';

class PlayListEntity {
  final int id;
  final String imagePath;
  final String title;
  final String author;
  final List<TrackEntity> trackList;

  PlayListEntity({
    required this.id,
    required this.imagePath,
    required this.title,
    required this.author,
    required this.trackList,
  });
  PlayListEntity.empty()
      : id = 0,
        imagePath = '',
        title = '',
        author = '',
        trackList = [];
  factory PlayListEntity.fromModelDb(PlayListModelDb db) {
    var trackList = db.tracks.data
        .map(
          (song) => TrackEntity(
            id: song.id,
            title: song.titleShort,
            author: song.artist.name,
            duration: song.duration,
            urlMp3: song.preview,
            imagePath: song.album.coverBig,
            idAuthor: song.artist.id,
            listTrack: song.artist.tracklist,
          ),
        )
        .toList();
    return PlayListEntity(
      id: db.id,
      imagePath: db.pictureBig,
      title: db.title,
      author: db.creator.name,
      trackList: trackList,
    );
  }
}
