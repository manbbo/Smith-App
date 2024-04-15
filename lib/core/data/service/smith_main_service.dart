import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:smith/core/data/model/pokemon.dart';

abstract class SmithMainService {
  Future<Pokemon> getPokemon(String id);
}

@Injectable(as: SmithMainService)
class SmithMainServiceImpl extends SmithMainService {
  final Dio _dio = Dio();

  @override
  Future<Pokemon> getPokemon(String id) async {
    try {
      final response = await _dio.get('https://pokeapi.co/api/v2/pokemon/$id');

      if (response.statusCode == 200) {
        return Pokemon.fromJson(response.data);
      } else {
        throw Exception('Failed to load Pokemon');
      }
    } catch (e) {
      throw Exception('Failed to connect to the server');
    }
  }
}
