part of 'pokelist_bloc.dart';

@freezed
class PokelistState with _$PokelistState {
  const factory PokelistState.initial() = _Initial;
  const factory PokelistState.loading() = _Loading;
  const factory PokelistState.loaded() = _Loaded;
}
