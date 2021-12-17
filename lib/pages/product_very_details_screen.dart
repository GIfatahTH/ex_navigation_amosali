import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../navigator.dart';

class ProductVeryDetailsPage extends StatelessWidget {
  const ProductVeryDetailsPage({Key? key}) : super(key: key);
  final details = const ['Granny Smith', 'Fuiji', 'Red Delicious'];

  @override
  Widget build(BuildContext context) {
    late final String detail;
    late final String product;
    try {
      final index = context.routeData.pathParams['detail'] as String;
      detail = details[int.parse(index)];
      product = context.routeData.pathParams['product'] as String;
    } catch (e) {
      return context.routeData.unKnownRoute;
    }

    return Row(
      children: [
        Flexible(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  const Text(
                    'Very detail Screen',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 40,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text('About $detail $product'),
                ],
              ),
            ),
          ),
        ),
        Flexible(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                const Spacer(flex: 2),
                const Text(
                  'Actions',
                  style: TextStyle(
                    fontSize: 21,
                    decoration: TextDecoration.underline,
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () => navigator.to(
                      '/checkout',
                      arguments: detail,
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      child: Center(child: Text('Add to Cart')),
                    ),
                  ),
                ),
                const Spacer(flex: 1)
              ],
            ),
          ),
        ),
      ],
    );
  }
}
