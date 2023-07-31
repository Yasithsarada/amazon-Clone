import 'package:amazon_clone/common/widgtes/Bottom_bar.dart';
import 'package:amazon_clone/features/admin/screens/add_Product_Screen.dart';
import 'package:amazon_clone/features/auth/screens/auth_screen.dart';
import 'package:amazon_clone/features/auth/screens/home/screens/catergory_deals_screen.dart';
import 'package:amazon_clone/features/auth/screens/home/screens/home_Screen.dart';
import 'package:amazon_clone/features/product%20details/screens/product_detail_screen.dart';
import 'package:amazon_clone/features/search/screens/search_Screen.dart';
import 'package:amazon_clone/models/product.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const AuthScreen(),
      );

    case HomeScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const HomeScreen(),
      );

    case BottomBar.routeName:
      return MaterialPageRoute(
        builder: (_) => const BottomBar(),
      );

    case AddProductScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const AddProductScreen(),
      );

    case CatergoryDealsScreen.routeName:
      final category = routeSettings.arguments as String;
      return MaterialPageRoute(
        builder: (_) => CatergoryDealsScreen(
          category: category,
        ),
      );

    case SearchScreen.routeName:
      final searchQuery = routeSettings.arguments as String;
      return MaterialPageRoute(
        builder: (_) => SearchScreen(
          searchQuery: searchQuery,
        ),
      );
    case ProductDetailScreen.routeName:
      final product = routeSettings.arguments as Product;
      return MaterialPageRoute(
        builder: (_) => ProductDetailScreen(product: product),
      );
    default:
      return MaterialPageRoute(
        builder: (_) => const Scaffold(
          body: Scaffold(
            body: Center(
              child: Text("Screen does not exist !"),
            ),
          ),
        ),
      );
  }
}
