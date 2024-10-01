import 'package:dio/dio.dart';

import 'package:app_music/features/artist/data/network/models/artist/artist_response_db_model.dart';
import 'package:app_music/features/artist/data/network/models/list_track_artist/artist_db_response.dart';

class DatasourceArtistNtw {
  final dio = Dio();

  Future<ArtistDbResponseModel> fetchDataArtist({required String url}) async {
    try {
      final response = await dio.get(url);
      if (response.statusCode == 200) {
        final data = response.data;
        final model = ArtistDbResponseModel.fromJson(data);
        return model;
      } else {
        throw Exception('Error al cargar los datos del artista, Codigo: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error al obtener los datos del artista: $e');
    }
  }

  Future<ArtistResponseDbModel> fetchArtistDb({required int id}) async {
    try {
      final response = await dio.get("https://api.deezer.com/artist/$id");
      final Map<String, dynamic> responseMap = response.data;
      final model = ArtistResponseDbModel.fromJson(responseMap);
      return model;
    } catch (e) {
      throw Exception('Error al obtener los datos del artista: $e');
    }
  }
}
