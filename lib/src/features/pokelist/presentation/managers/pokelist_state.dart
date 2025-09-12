part of 'pokelist_bloc.dart';

@freezed
class PokelistState with _$PokelistState {
  const factory PokelistState({
    List<PokeModels>? pokes,
    GlobalManagerState? state,
    @Default(1) int selectedIndex,
    String? message,
  }) = _Loaded;
}
