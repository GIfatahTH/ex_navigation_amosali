import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../navigator.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late final String? detail;
    detail = context.routeData.arguments as String?;

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
                    'Checkout Screen',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 40,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text('$detail'),
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
                    onPressed: () => navigator.to('/'),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      child: Center(child: Text('Checkout')),
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
