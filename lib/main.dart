import 'package:bag_app/logic/blocs/products_bloc/products_bloc.dart';
import 'package:bag_app/logic/cubits/internet/internet_cubit.dart';
import 'package:bag_app/logic/cubits/thems/them_cubit.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:bag_app/ui/router/app_route.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'data/constants/static_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<InternetCubit>(
            create: (context) => InternetCubit(connectivity: Connectivity())),
        BlocProvider(
          create: (context) => ThemeCubit(),
        ),
        BlocProvider<ProductsBloc>(
          create: (context) => ProductsBloc()..add(FetchAllProducts()),
          //TODO: maybe changed later
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.white,
      title: 'Shopping App',
      theme: StaticData().lightThemData,
      darkTheme: StaticData().darkThemeData,
      themeMode: context.watch<ThemeCubit>().isDarkThemEnabled
          ? ThemeMode.dark
          : ThemeMode.light,
      onGenerateRoute: AppRoute().onGeneratedRoute,
    );
  }
}
