import 'package:bag_app/ui/screens/add_and_edit_items/add_new_product.dart';
import 'package:bag_app/ui/screens/authenticate.dart';
import 'package:bag_app/ui/screens/cart/cart.dart';
import 'package:bag_app/ui/screens/login_and_register/login.dart';
import 'package:bag_app/ui/screens/login_and_register/register.dart';
import 'package:bag_app/ui/screens/product_details/details.dart';
import 'package:bag_app/ui/screens/products_of_category/products_of_category.dart';
import 'package:bag_app/ui/screens/purchase/purchase.dart';
import 'package:bag_app/ui/screens/welcome/welcoming.dart';
import 'package:bag_app/ui/screens/wish_list/wish_list.dart';
import 'package:flutter/cupertino.dart';

import 'app_arguments.dart';

class AppRoute {
  Route onGeneratedRoute(RouteSettings routeSettings) {
    final AppArguments args = routeSettings.arguments;
    switch (routeSettings.name) {
      case '/':
        return CupertinoPageRoute(
          builder: (context) => Authenticate(), //true if logged false if not
        );
      case '/Welcoming':
        return CupertinoPageRoute(
          builder: (context) => Welcoming(),
        );
      case '/Details':
        return CupertinoPageRoute(
          builder: (context) => Details(product: args.product, tag: args.tag),
        );
      case '/WishList':
        return CupertinoPageRoute(
          builder: (context) => WishList(),
        );
      case '/Cart':
        return CupertinoPageRoute(
          builder: (context) => Cart(),
        );
      case '/Purchase':
        return CupertinoPageRoute(
          builder: (context) => Purchase(),
        );
      case '/SignUp':
        return CupertinoPageRoute(
          builder: (context) => Register(),
        );
      case '/Login':
        return CupertinoPageRoute(
          builder: (context) => Login(),
        );
      case '/ProductsScreen':
        return CupertinoPageRoute(
          builder: (context) => ProductsScreen(args.index),
        );
      case '/AddNewProduct':
        return CupertinoPageRoute(
          builder: (context) => AddNewProduct(),
        );
      default:
        return null;
    }
  }
}
