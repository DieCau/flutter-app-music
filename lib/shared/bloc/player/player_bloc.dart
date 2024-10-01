import 'dart:async';
import 'package:app_music/shared/entity_global/track_global_entity.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'player_event.dart';
part 'player_state.dart';

class PlayerBloc extends Bloc<PlayerEvent, PlayerState> {
  final AudioPlayer audioPlayer;

  int currentTrackIndex = -1;
  PlayerBloc({required this.audioPlayer}) : super(PlayerState.initial()) {
    // Escucha los cambios de duración total del audio
    audioPlayer.onDurationChanged.listen((duration) {
      // ignore: invalid_use_of_visible_for_testing_member
      emit(state.copyWith(totalPosition: duration));
    });

    // Escucha los cambios en la posición actual del audio
    audioPlayer.onPositionChanged.listen((position) {
      // ignore: invalid_use_of_visible_for_testing_member
      emit(state.copyWith(currentPosition: position));
    });

    //Escucha cuando el audio se completa
    audioPlayer.onPlayerComplete.listen((event) {
      add(NextEvent());
    });
    audioPlayer.onPlayerComplete.listen((event) {
      add(StopEvent());
    });

    on<FetcTracksEvent>(fetcTracksEvent);
    on<FetcTrackIdEvent>(fetcTrackIdEvent);
    on<PlayEvent>(playEvent);
    on<ToggleEnvet>(toggleEnvet);
    on<NextEvent>(nextEvent);
    on<PauseEvent>(pauseEvent);
    on<PreviusEvent>(previusEvent);
    on<StopEvent>(stopEvent);
    on<SeekEvent>(seekEvent);
  }
  Future<void> fetcTracksEvent(FetcTracksEvent event, Emitter<PlayerState> emit) async {
    emit(state.copyWith(
      status: PlayerStatus.loading,
    ));
    try {
      final response = event.listModel;
      emit(state.copyWith(tracksList: response, status: PlayerStatus.sucess));
    } catch (e) {
      emit(state.copyWith(status: PlayerStatus.error));
    }
  }

  Future<void> fetcTrackIdEvent(FetcTrackIdEvent event, Emitter<PlayerState> emit) async {
    try {
      final newState = state.copyWith(currentTrack: event.model);
      emit(newState);
    } catch (e) {
      emit(state.copyWith(status: PlayerStatus.error));
    }
  }

  Future<void> playEvent(PlayEvent event, Emitter<PlayerState> emit) async {
    try {
      await audioPlayer.setSourceUrl(event.urlMp3);
      await audioPlayer.play(UrlSource(event.urlMp3));
      currentTrackIndex = event.index;

      emit(state.copyWith(
        status: PlayerStatus.sucess,
        reproductorStatus: ReproductorStatus.play,
        index: currentTrackIndex,
      ));
    } catch (e) {
      emit(state.copyWith(status: PlayerStatus.error));
    }
  }

  Future<void> nextEvent(NextEvent event, Emitter<PlayerState> emit) async {
    if (currentTrackIndex < state.tracksList.length - 1) {
      currentTrackIndex++;
      final nextTrack = state.tracksList[currentTrackIndex];
      add(PlayEvent(urlMp3: nextTrack.urlMp3, index: currentTrackIndex));
      emit(state.copyWith(
        currentTrack: nextTrack,
        index: currentTrackIndex,
      ));
    }
  }

  Future<void> previusEvent(PreviusEvent event, Emitter<PlayerState> emit) async {
    if (state.tracksList.length - 1 > currentTrackIndex) {
      currentTrackIndex--;
      final nextTrack = state.tracksList[currentTrackIndex];
      add(PlayEvent(urlMp3: nextTrack.urlMp3, index: currentTrackIndex));
      emit(state.copyWith(
        currentTrack: nextTrack,
        index: currentTrackIndex,
      ));
    }
  }

  Future<void> toggleEnvet(ToggleEnvet event, Emitter<PlayerState> emit) async {
    if (state.reproductorStatus == ReproductorStatus.play) {
      await audioPlayer.pause();
      emit(state.copyWith(reproductorStatus: ReproductorStatus.pause));
    } else {
      await audioPlayer.resume();
      emit(state.copyWith(reproductorStatus: ReproductorStatus.play));
    }
  }

  Future<void> seekEvent(SeekEvent event, Emitter<PlayerState> emit) async {
    emit(state.copyWith(
      currentPosition: event.seek,
    ));
    await audioPlayer.seek(event.seek);
  }

  Future<void> stopEvent(StopEvent event, Emitter<PlayerState> emit) async {
    await audioPlayer.stop();

    emit(state.copyWith(reproductorStatus: ReproductorStatus.stop));
  }

  Future<void> pauseEvent(PauseEvent event, Emitter<PlayerState> emit) async {
    await audioPlayer.pause();
    emit(state.copyWith(reproductorStatus: ReproductorStatus.pause));
  }

  @override
  Future<void> close() {
    audioPlayer.dispose();
    audioPlayer.stop();
    return super.close();
  }
}
