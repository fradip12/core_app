import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../data/models/poke/poke_models.dart';
import '../../../../data/repositories/poke/poke_repository.dart';
import '../../../../shared/models/result.dart';

part 'pokelist_state.dart';
part 'pokelist_event.dart';
part 'pokelist_bloc.freezed.dart';

@injectable
class PokelistBloc extends Bloc<PokelistEvent, PokelistState> {
  final PokeRepository repository;
  PokelistBloc(this.repository) : super(const PokelistState.initial()) {
    on<_Load>((event, emit) async {
      emit(const PokelistState.loading());
      final result = await repository.getPokes(limit: 20, offset: 0);

      switch (result) {
        case Ok<List<PokeModels>>():
          emit(PokelistState.loaded(pokes: result.value));
        case Error():
          emit(PokelistState.error(message: result.error.toString()));
      }
    });
  }
}
