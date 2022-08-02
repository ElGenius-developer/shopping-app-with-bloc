import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MaterialData{

  //custom category
  static final  kPrimaryColor = Color(0xF8CD265A);
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
      color: Colors.red[900], systemOverlayStyle: SystemUiOverlayStyle.dark,
    ),
    shadowColor: Color(0xff1B222F),

    colorScheme: ColorScheme.dark(),
    textSelectionTheme: TextSelectionThemeData(
      selectionColor: Colors.white,
    ),
  );
////////Light Theme

  ThemeData lightThemData = ThemeData(
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