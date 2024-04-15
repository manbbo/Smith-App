import 'package:flutter/material.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';
import 'package:smith/checkout/presentation/checkout.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> checkoutIds = [];
  bool addedProduct = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () async {
                var res = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SimpleBarcodeScannerPage(),
                    ));
                setState(() {
                  if (res is String) {
                    checkoutIds.add(res);
                    addedProduct = true;
                  }
                });
              },
              child: const Column(
                children: [
                  Text('ESCANEIE UM PRODUTO'),
                  Icon(Icons.add_shopping_cart)
                ],
              ),
            ),
            SizedBox(
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
