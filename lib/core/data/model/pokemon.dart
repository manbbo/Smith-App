import 'package:equatable/equatable.dart';

class Pokemon extends Equatable {
  const Pokemon({
    required this.id,
    required this.name,
    required this.sprites,
  });

  final String id;
  final String name;
  final Sprites sprites;

  @override
  List<Object?> get props => [
        id,
        name,
        sprites,
      ];

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      id: (json['id'] as int).toString(),
      name: json['name'],
      sprites: Sprites.fromJson(json['sprites'] as Map<String, dynamic>),
    );
  }
}

class Species extends Equatable {
  const Species({
    required this.name,
    required this.url,
  });

  final String name;
  final String url;

  @override
  List<Object?> get props => [
        name,
        url,
      ];

  factory Species.fromJson(Map<String, dynamic> json) {
    return Species(
      name: json['name'],
      url: json['url'],
    );
  }
}

class Sprites extends Equatable {
  const Sprites({
    required this.backDefault,
    required this.backFemale,
    required this.backShiny,
    required this.backShinyFemale,
    required this.frontDefault,
    required this.frontFemale,
    required this.frontShiny,
    required this.frontShinyFemale,
    required this.other,
    required this.versions,
  });

  final String? backDefault;
  final String? backFemale;
  final String? backShiny;
  final String? backShinyFemale;
  final String? frontDefault;
  final String? frontFemale;
  final String? frontShiny;
  final String? frontShinyFemale;
  final Map<String, Sprite> other;
  final Map<String, Sprite> versions;

  @override
  List<Object?> get props => [
        backDefault,
        backFemale,
        backShiny,
        backShinyFemale,
        frontDefault,
        frontFemale,
        frontShiny,
        frontShinyFemale,
        other,
        versions,
      ];

  factory Sprites.fromJson(Map<String, dynamic> json) {
    return Sprites(
      backDefault: json['back_default'],
      backFemale: json['back_female'],
      backShiny: json['back_shiny'],
      backShinyFemale: json['back_shiny_female'],
      frontDefault: json['front_default'],
      frontFemale: json['front_female'],
      frontShiny: json['front_shiny'],
      frontShinyFemale: json['front_shiny_female'],
      other: (json['other'] as Map<String, dynamic>).map((key, value) =>
          MapEntry(key, Sprite.fromJson(value as Map<String, dynamic>))),
      versions: (json['versions'] as Map<String, dynamic>).map((key, value) =>
          MapEntry(key, Sprite.fromJson(value as Map<String, dynamic>))),
    );
  }
}

class Sprite extends Equatable {
  const Sprite({
    required this.frontDefault,
    required this.frontFemale,
  });

  final String? frontDefault;
  final String? frontFemale;

  @override
  List<Object?> get props => [
        frontDefault,
        frontFemale,
      ];

  factory Sprite.fromJson(Map<String, dynamic> json) {
    return Sprite(
      frontDefault: json['front_default'],
      frontFemale: json['front_female'],
    );
  }
}
