import 'package:injectable/injectable.dart';
import 'package:smith/core/data/model/pokemon.dart';
import 'package:smith/core/data/service/smith_main_service.dart';

abstract class SmithMainRepository {
  Future<Pokemon> getPokemon(String id);
}

@Injectable(as: SmithMainRepository)
class SmithMainRepositoryImpl implements SmithMainRepository {
  SmithMainRepositoryImpl(this._listService);

  final SmithMainService _listService;

  @override
  Future<Pokemon> getPokemon(String id) async {
    final result = await _listService.getPokemon(id);

    return result;
  }
}
