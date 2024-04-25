import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';
import 'package:smith/checkout/presentation/checkout.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map<String, int> checkoutIds = {};
  bool addedProduct = false;
  
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    _controller.text = '0';
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext mainContext) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () async {
                var itemQuantity = 0;
                var res = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SimpleBarcodeScannerPage(),
                    ));
                showDialog<int>(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Qual a quantidade?'),
                        actions: [
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ElevatedButton(
                                      onPressed: () => setState(() {
                                            if (itemQuantity > 0) {
                                              itemQuantity = itemQuantity - 1;
                                              _controller.text =
                                                  itemQuantity.toString();
                                            }
                                          }),
                                      child: const Icon(Icons.add)),
                                  SizedBox(
                                    height: 50.0,
                                    width: 70.0,
                                    child: TextField(
                                      keyboardType: TextInputType.number,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly,
                                        LengthLimitingTextInputFormatter(1),
                                      ],
                                      controller: _controller,
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                  ),
                                  ElevatedButton(
                                      onPressed: () => setState(() {
                                            if (itemQuantity <= 9) {
                                              itemQuantity = itemQuantity + 1;
                                              _controller.text =
                                                  itemQuantity.toString();

                                              if (res is String) {
                                                checkoutIds.putIfAbsent(
                                                    res, () => itemQuantity);
                                                addedProduct =
                                                    checkoutIds.isNotEmpty &&
                                                        itemQuantity != 0;
                                              }
                                            }
                                          }),
                                      child: const Icon(Icons.add)),
                                ],
                              ),
                              Center(
                                child: ElevatedButton(
                                  onPressed: () => {
                                    Navigator.of(context).pop(),
                                    _controller.text = '0'
                                  },
                                  child: const Text('CONFIRMAR'),
                                ),
                              )
                            ],
                          )
                        ],
                      );
                    });
              },
              child: const Column(
                children: [
                  Text('ESCANEIE UM PRODUTO'),
                  Icon(Icons.add_shopping_cart)
                ],
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            ElevatedButton(
                onPressed: addedProduct
                    ? () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CheckoutPage(
                                      checkoutIds: checkoutIds,
                                      onPressed: (id) {
                                        setState(() {
                                          checkoutIds.remove(id);
                                          addedProduct = false;
                                        });
                                      },
                                    )),
                          )
                        }
                    : null,
                child: Column(
                  children: [
                    const Text('CARRINHO'),
                    Icon(addedProduct
                    ? Icons.shopping_basket
                        : Icons.shopping_basket_outlined)
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
