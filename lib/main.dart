import 'package:bag_app/logic/blocs/products_bloc/products_bloc.dart';
import 'package:bag_app/logic/cubits/internet/internet_cubit.dart';
import 'package:bag_app/logic/cubits/thems/them_cubit.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:bag_app/ui/router/app_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     return MultiBlocProvider(
      providers: [
    BlocProvider<InternetCubit>(
    create: (context) =>new  InternetCubit(connectivity: Connectivity())
    ),
        BlocProvider<ThemeCubit>(
          create: (context) => ThemeCubit(),
        ), BlocProvider(
          create: (context) => ProductsBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        color: Colors.white,
        title: 'Shopping App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: AppRoute().onGeneratedRoute,
       ),
    );
  }
}
