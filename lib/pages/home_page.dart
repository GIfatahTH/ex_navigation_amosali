import 'package:flutter/material.dart';

import '../navigator.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  static const String dummyText =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.';

  final products = const ['Apple', 'Orange', 'Banana'];
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                SizedBox(height: 16),
                Text(
                  'Home Screen',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 40,
                  ),
                ),
                SizedBox(height: 16),
                Text(dummyText),
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
                const Text(
                  'List of Products',
                  style: TextStyle(
                    fontSize: 21,
                    decoration: TextDecoration.underline,
                  ),
                ),
                const SizedBox(height: 16),
                for (final product in products)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () => navigator.to('/home/$product'),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Center(child: Text(product)),
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
