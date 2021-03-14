import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'them_state.dart';

class ThemeCubit extends Cubit<ThemState> {
   static MediaQueryData mediaQuery;
  ThemeCubit() : super(ThemInitial());

}
