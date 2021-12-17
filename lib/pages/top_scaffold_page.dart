import 'package:ex_navigation_amosali/navigator.dart';
import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class TopScaffoldPage extends StatelessWidget {
  const TopScaffoldPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: const [
          Flexible(child: MenuBarWidget()),
          Flexible(
            flex: 4,
            child: BodyWidget(),
          ),
        ],
      ),
    );
  }
}

class BodyWidget extends StatelessWidget {
  const BodyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return context.routerOutlet;
  }
}

class MenuBarWidget extends StatelessWidget {
  const MenuBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final location = navigator.routeData.location;
    bool showCheckout = navigator.routeData.path.startsWith('/home/:product') ||
        location == '/checkout';
    return Card(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
            child: Text(
              'Menu Bar',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 24,
              ),
            ),
          ),
          TextButton(
            onPressed: () => navigator.to('/home'),
            style: ElevatedButton.styleFrom(
              primary: location.startsWith('/home') ? Colors.orange : null,
            ),
            child: const Text(
              'Home',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
          ),
          if (showCheckout) const SizedBox(height: 16),
          if (showCheckout)
            TextButton(
              onPressed: () => navigator.to('/checkout'),
              style: ElevatedButton.styleFrom(
                primary:
                    location.startsWith('/checkout') ? Colors.orange : null,
              ),
              child: const Text(
                'Checkout',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
          const SizedBox(height: 16),
          TextButton(
            onPressed: () => navigator.to('/page-b'),
            style: ElevatedButton.styleFrom(
              primary: location.startsWith('/page-b') ? Colors.orange : null,
            ),
            child: const Text(
              'Page B',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
          ),
          const SizedBox(height: 16),
          TextButton(
            onPressed: () => navigator.to('/page-c'),
            style: ElevatedButton.styleFrom(
              primary: location.startsWith('/page-c') ? Colors.orange : null,
            ),
            child: const Text(
              'Page C',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
