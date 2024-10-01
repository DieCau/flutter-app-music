import 'dart:async';

import 'package:app_music/features/home/domain/entities/recent_entity/recent_home_entity.dart';
import 'package:app_music/features/home/domain/repository/playlist_home_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final PlayListHomeRepository playListHomeRepository;
  HomeBloc({required this.playListHomeRepository})
      : super(
          const HomeState(
            plalistHomeEntity: [],
            homeStatus: HomeStatus.initial,
          ),
        ) {
    on<FetchPlayListHomeEvent>(fetchPlayListEventState);
    on<HelloEvent>(helloEventState);
  }

  Future<void> fetchPlayListEventState(
      FetchPlayListHomeEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(homeStatus: HomeStatus.loading));

    try {
      final response = await playListHomeRepository.fetchPlayListHome();
      emit(state.copyWith(plalistHomeEntity: response, homeStatus: HomeStatus.sucess));
    } catch (e) {
      emit(state.copyWith(homeStatus: HomeStatus.error));
    }
  }

  FutureOr<void> helloEventState(HelloEvent event, Emitter<HomeState> emit) {}
}
