import 'package:bag_app/data/constants/material_data.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
 import 'package:meta/meta.dart';

part 'them_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
   static late MediaQueryData mediaQuery;
  ThemeCubit() : super(ThemeInitial());
    Color defaultColor = MaterialData().pinkColor;
   Color alternativeColor = MaterialData().blueColor;

   // Box <bool>box ;
    bool isDarkThemEnabled=false;
   void switchThem(ThemeMode newMode ) {

     switch(newMode){
       case ThemeMode.system:
         emit(DefaultSystemThemState());
         break;
       case ThemeMode.light:
          isDarkThemEnabled=false;
          emit(LightThemState());
         break;
       case ThemeMode.dark:
          isDarkThemEnabled=true;
          emit(DarkThemState());
         break;
     }


/*
     saveTheme();
*/
   }
  /* void saveTheme() async{
     try {
       await box.put('theme',isDarkThemEnabled );
     } catch (e) {
       print(e.toString());
     }
   }*/
 /*  void initialTheme(){
     if(box.isEmpty)
     {
       isDarkThemEnabled=false;
       saveTheme();
     }
     else{
       isDarkThemEnabled=box.values.first;
     }

   }*/
/*   @override
   Future<Function> close() {
     Hive.close();
     box.close();
     return super.close();
   }*/

}
