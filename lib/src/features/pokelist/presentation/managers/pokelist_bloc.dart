import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'pokelist_state.dart';
part 'pokelist_event.dart';
part 'pokelist_bloc.freezed.dart';

@injectable
class PokelistBloc extends Bloc<PokelistEvent, PokelistState> {
  PokelistBloc() : super(const PokelistState.initial()) {}
}
