part of 'pokelist_bloc.dart';

@freezed
class PokelistState with _$PokelistState {
  const factory PokelistState.initial() = _Initial;
  const factory PokelistState.loading() = _Loading;
  const factory PokelistState.loaded({
    List<PokeModels>? pokes,
  }) = _Loaded;
  const factory PokelistState.error({
    String? message,
  }) = _Error;
}
