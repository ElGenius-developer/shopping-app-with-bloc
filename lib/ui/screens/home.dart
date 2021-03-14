
import 'package:bag_app/data/constants/static_data.dart';
import 'package:bag_app/logic/blocs/products_bloc/products_bloc.dart';
import 'package:bag_app/logic/cubits/thems/them_cubit.dart';
import 'package:bag_app/ui/router/app_arguments.dart';
import 'package:bag_app/ui/widgets/custom_text.dart';
import 'package:bag_app/ui/widgets/internet_widget.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _color = StaticData().pinkColor;
    ThemeCubit.mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          )
        ],
        backgroundColor: _color,
        title: CustomText(
          fontSize: 25,
          text: 'Categories',
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        centerTitle: true,
      ),
      drawer: Drawer(),
      body: InternetWidget(
        child: GridView.builder(
          itemCount: StaticData().categoriesList.length ?? 0,
          itemBuilder: (context, index) => GestureDetector(
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    width: ThemeCubit.mediaQuery.size.width - 20,
                    height: ThemeCubit.mediaQuery.size.height / 3,
                    child: ExtendedImage.asset(
                      "images/${StaticData().categoriesList[index]}.jpeg",
                      height: ThemeCubit.mediaQuery.size.height / 3,
                      width: ThemeCubit.mediaQuery.size.width / 2.6,
                      fit: BoxFit.fill,
                    ),
                  ),
                  CustomText(
                    text: StaticData()
                        .categoriesList[index]
                        .toUpperCase()
                        .toString(),
                    fontWeight: FontWeight.bold,
                  )
                ],
              ),
            ),
            onTap: () {
              BlocProvider.of<ProductsBloc>(context)..add(FetchProductsByCategory(StaticData().categoriesList[index]));
              Navigator.pushNamed(context,'/ProductsScreen',arguments:AppArguments(index));
            }
          ),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: ThemeCubit.mediaQuery.size.aspectRatio * 1.14),
        ),
      ),
    );
  }
}
