import 'package:app_music/features/home/data/local/datasource/datasource_local_db.dart';
import 'package:app_music/features/home/domain/repository/download_music_repository.dart';
import 'package:app_music/shared/database_service/models/music_localdb.dart';
import 'package:dio/dio.dart';

class MusicDownloadRepositoryImp extends DownloadMusicRepository {
  final DatasourceLocalDb datasourceLocalDb;

  final dio = Dio();

  MusicDownloadRepositoryImp({required this.datasourceLocalDb});
  @override
  Future<List<MusicLocalDb>> getAllMusicDownload() async {
    return await datasourceLocalDb.getAllMusicDownload();
  }

  @override
  Future<void> insertMusic({required MusicLocalDb music}) async {
    await datasourceLocalDb.inserMusic(music: music);
  }
}
