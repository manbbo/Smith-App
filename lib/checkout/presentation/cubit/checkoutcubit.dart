import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:smith/core/data/model/pokemon.dart';
import 'package:smith/core/data/repository/smith_main_repository.dart';

part 'checkoutstate.dart';

abstract class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit() : super(const CheckoutState.loading());

  Future<void> getPokemon(List<String> ids);
}

@Injectable(as: CheckoutCubit)
class CheckoutCubitImpl extends CheckoutCubit {
  CheckoutCubitImpl(
    this._repository,
  ) : super();

  final SmithMainRepository _repository;
  List<Pokemon> pokemons = [];

  @override
  Future<void> getPokemon(List<String> ids) async {
    try {
      for (String id in ids) {
        Pokemon result = await _repository.getPokemon(id);
        pokemons.add(result);
      }

      emit(CheckoutState.result(pokemons));
    } catch (_) {
      emit(const CheckoutState.error());
    }
  }
}
