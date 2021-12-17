import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../navigator.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({Key? key}) : super(key: key);

  static const String dummyText =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.';

  final details = const ['Granny Smith', 'Fuiji', 'Red Delicious'];

  @override
  Widget build(BuildContext context) {
    late final String product;
    try {
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                Text(
                  '$product Detail Screen',
                  style: const TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 40,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(dummyText),
              ],
            ),
          ),
        ),
        Flexible(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                const Spacer(flex: 2),
                Text(
                  'List of ${product}s',
                  style: const TextStyle(
                    fontSize: 21,
                    decoration: TextDecoration.underline,
                  ),
                ),
                const SizedBox(height: 16),
                for (final detail in details)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () => navigator
                          .to('/home/$product/${details.indexOf(detail)}'),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Center(child: Text(detail)),
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
