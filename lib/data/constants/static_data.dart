import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StaticData {
  final sentences = [
    "Welcome to my Shopping app.",
    "It's a demo app for practicing on flutter development",
    'You can create an Email or login then you can choose product to buy.',
    'if you like any product you can add it to your cart to buy it ',
    'or you can add it to wish list '
  ];
  final categoriesList = [
    "electronics",
    "jewelery",
    "men clothing",
    "women clothing"
  ];
  final typesList =[
  {'coffee machine', 'speaker', 'laptop', 'smart watches', 'headset', 'digital camera', 'smart tv', 'power bank', 'fitness technology'},
{'earring & necklaces', 'jewelry accessories', 'rings', 'bracelets', 'eyewear accessories'},
{'jeans','shirt','pullover','boots','jacket','sneakers','hoodie','sunglasses'},
    {'bags', 'pants','blouses & shirts','hoodies & sweatshirts','heels','coats','jackets & vests','pullovers','boots'}
  ];

  //custom category
  final Color pinkColor = Color(0xF8CD265A);
  final Color blueColor = Color(0xE90974C8);

////////Dark Theme
  ThemeData darkThemeData = ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primaryColor: Colors.red[800],
    cardColor: Color(0xff1B222F),
    // backgroundColor:Color(0xff1B222F) ,
    scaffoldBackgroundColor: Color(0xff1B222F),
    primaryColorDark: Color(0xff1B222F),
    canvasColor: Color(0xff1B222F),
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.red[800],
    ),
    appBarTheme: AppBarTheme(
      brightness: Brightness.light,


      color: Colors.red[900],

    ),
    shadowColor: Color(0xff1B222F),

    colorScheme: ColorScheme.dark(),
    textSelectionTheme: TextSelectionThemeData(
      selectionColor: Colors.white,
    ),
  );
////////Light Theme

  ThemeData lightThemData =ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primaryColor: Colors.red,
    canvasColor: Color(0xFFE5E8E8),
    scaffoldBackgroundColor: Color(0xffF0F3F4),
    backgroundColor: Color(0xffF0F3F4),
    cardColor: Color(0xffEBF5F5),
    shadowColor: Colors.black38,
    highlightColor: Colors.white10,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      // selectedItemColor: Colors.black12,
      selectedItemColor: Colors.black,
    ),
    appBarTheme: AppBarTheme(
      color: Color(0xF8CD265A),
      brightness: Brightness.dark,

    ),
    colorScheme: ColorScheme.light(),
    textSelectionTheme: TextSelectionThemeData(
      selectionColor: Colors.black87,
      cursorColor: Colors.black,
    ),
  );
}
