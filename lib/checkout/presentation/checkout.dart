import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:smith/checkout/presentation/cubit/checkoutcubit.dart';
import 'package:smith/checkout/presentation/widget/pokemon_widget.dart';
import 'package:smith/core/data/model/pokemon.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({
    super.key,
    required this.checkoutIds,
    required this.onPressed,
  });

  final Map<String, int> checkoutIds;
  final void Function(String) onPressed;

  @override
  State<CheckoutPage> createState() => __CheckoutPageState();
}

class __CheckoutPageState extends State<CheckoutPage> {
  CheckoutCubit cubit = GetIt.I.get<CheckoutCubit>();
  @override
  void initState() {
    cubit.getPokemon(widget.checkoutIds.keys.toList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CHECKOUT'),
      ),
      body: Center(
        child: (widget.checkoutIds.length <= 0)
            ? const Center(
                child: Text('LISTA VAZIA'),
              )
            : BlocProvider(
          create: (_) => cubit,
          child: BlocBuilder<CheckoutCubit, CheckoutState>(
            builder: (context, state) {
              switch (state.runtimeType) {
                case CheckoutResultState:
                  List<Pokemon> pokemon = (state as CheckoutResultState).result;

                        return Column(
                          children: <Widget>[
                            Expanded(
                              child: ListView.builder(
                                itemCount: pokemon.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return PokemonItemWidget(
                                    onPressed: (id) {
                                      setState(() {
                                        pokemon.removeAt(index);
                                      });
                                      widget.onPressed(id);
                                    },
                                    pokemon: pokemon[index],
                                  );
                                },
                              ),
                            ),
                            Container(
                              child: const Text(
                                'TESTE',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        );

                case CheckoutLoadingState:
                  return const Center(
                    child: CircularProgressIndicator(),
                  );

                default:
                  return const Center(
                    child: Text('ALGO DEU ERRADO\nTENTE NOVAMENTE'),
                  );
              }
            },
          ),
        ),
      ),
    );
  }
}
