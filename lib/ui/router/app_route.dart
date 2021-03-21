
import 'package:bag_app/ui/screens/authenticate.dart';
import 'package:bag_app/ui/screens/cart.dart';
import 'package:bag_app/ui/screens/details.dart';
import 'package:bag_app/ui/screens/products_screen.dart';
import 'package:bag_app/ui/screens/welcoming.dart';
import 'package:bag_app/ui/screens/login.dart';
import 'package:bag_app/ui/screens/purchase.dart';
import 'package:bag_app/ui/screens/register.dart';
import 'package:bag_app/ui/screens/wish_list.dart';
import 'package:flutter/cupertino.dart';

import 'app_arguments.dart';

class AppRoute {
  Route onGeneratedRoute(RouteSettings routeSettings) {
    final AppArguments args = routeSettings.arguments;
switch (routeSettings.name) {
      case '/':
        return CupertinoPageRoute(
          builder: (context) => Authenticate(),//true if logged false if not
        );
        case '/Welcoming':
        return CupertinoPageRoute(
          builder: (context) => Welcoming(),
        );
      case '/Details':
        return CupertinoPageRoute(
          builder: (context) => Details(),
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
        ); case '/SignUp':
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
      default:
        return null;
    }
  }
}
