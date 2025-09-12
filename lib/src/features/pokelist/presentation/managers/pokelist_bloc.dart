import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../data/models/poke/poke_models.dart';
import '../../../../data/repositories/poke/poke_repository.dart';
import '../../../../shared/enum/global_manager_state.dart';
import '../../../../shared/models/base_results.dart';

part 'pokelist_state.dart';
part 'pokelist_event.dart';
part 'pokelist_bloc.freezed.dart';

@injectable
class PokelistBloc extends Bloc<PokelistEvent, PokelistState> {
  final PokeRepository repository;
  PokelistBloc(this.repository) : super(const _Loaded()) {
    on<_Load>((event, emit) async {
      emit(state.copyWith(state: GlobalManagerState.loading));
      final result = await repository.getPokes();

      switch (result) {
        case Ok<List<PokeModels>>():
          emit(state.copyWith(
            state: GlobalManagerState.loaded,
            pokes: result.value,
          ));
        case Error():
          emit(state.copyWith(
            state: GlobalManagerState.error,
            message: result.error.toString(),
          ));
      }
    });

    on<_Select>((event, emit) {
      final index = state.pokes?.indexWhere((poke) => poke.id == event.id) ?? 0;
      emit(state.copyWith(selectedIndex: index));
    });
  }
}
