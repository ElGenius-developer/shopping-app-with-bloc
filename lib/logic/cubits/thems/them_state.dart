part of 'them_cubit.dart';

@immutable
abstract class ThemeState {}

class ThemeInitial extends ThemeState {}
class DarkThemState extends ThemeState {}
class LightThemState extends ThemeState {}
class DefaultSystemThemState extends ThemeState {}