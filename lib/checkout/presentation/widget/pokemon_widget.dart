import 'package:flutter/material.dart';
import 'package:smith/core/data/model/pokemon.dart';

class PokemonItemWidget extends StatefulWidget {
  const PokemonItemWidget({
    super.key,
    required this.pokemon,
    required this.onPressed,
  });

  final Pokemon pokemon;
  final void Function(String) onPressed;

  @override
  _PokemonItemState createState() => _PokemonItemState();
}

class _PokemonItemState extends State<PokemonItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(16.0),
                ),
                child: Image.network(
                  widget.pokemon.sprites.frontDefault ?? '',
                  height: 200,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => const Icon(Icons.error),
                ),
              ),
              const SizedBox(height: 16.0),
              Text(
                widget.pokemon.name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10.0),
              ElevatedButton(
                onPressed: () {
                  widget.onPressed(widget.pokemon.id.toString());
                },
                child: const Icon(Icons.remove_shopping_cart),
              )
            ],
          ),
        ),
      ),
    );
  }
}
