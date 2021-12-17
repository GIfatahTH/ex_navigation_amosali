import 'package:states_rebuilder/states_rebuilder.dart';

import 'pages/checkout_page.dart';
import 'pages/home_page.dart';
import 'pages/home_page_scaffold.dart';
import 'pages/page_b.dart';
import 'pages/page_c.dart';
import 'pages/product_details_page.dart';
import 'pages/product_very_details_screen.dart';
import 'pages/sign_in_page.dart';
import 'pages/top_scaffold_page.dart';

final navigator = RM.injectNavigator(
  builder: (_) => const TopScaffoldPage(),
  routes: {
    '/sign-in': (data) => const SignInPage(),
    '/': (data) => data.redirectTo('/home'),
    '/home': (data) => RouteWidget(
          // builder: (_) => const HomePageScaffold(),
          routes: {
            '/': (data) => const HomePage(),
            '/:product': (data) => const ProductDetailsPage(),
            '/:product/:detail': (data) => const ProductVeryDetailsPage(),
          },
        ),
    '/checkout': (data) => const CheckoutPage(),
    '/page-b': (data) => const PageB(),
    '/page-c': (data) => const PageC(),
  },
);
