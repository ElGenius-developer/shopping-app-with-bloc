import 'package:bag_app/data/constants/static_data.dart';
import 'package:bag_app/logic/blocs/products_bloc/products_bloc.dart';
import 'package:bag_app/logic/cubits/thems/them_cubit.dart';
import 'package:bag_app/ui/adaptive_ui_component/responsive_widget/responsive_widget.dart';
import 'package:bag_app/ui/router/app_arguments.dart';
import 'package:bag_app/ui/widgets/custom_text.dart';
import 'package:bag_app/ui/widgets/internet_widget.dart';
import 'package:bag_app/ui/widgets/my_custom_app_bar.dart';
 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsScreen extends StatelessWidget {
  final int? index;

  const ProductsScreen(this.index);
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: MyCustomAppBar(
        title: StaticData().categoriesList[index!].replaceRange(0, 1,
            StaticData().categoriesList[index!].toUpperCase().substring(0, 1)),
        color: Theme.of(context).scaffoldBackgroundColor,
        showTrailing: false,
        actions: [
          IconButton(
            icon: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: context.watch<ThemeCubit>().isDarkThemEnabled
                        ? Colors.grey[300]!
                        : Colors.black12,
                    blurRadius: 10.0,
                  ),
                ],
              ),
              child: Icon(
                CupertinoIcons.heart_fill,
                color: Color(0xFFE50050),
                size: 25,
              ),
            ),
            onPressed: () {
              //TODO:will navigate to Wish-list screen
            },
          ),
        ],
      ),
      body: InternetWidget(
        child:
            BlocBuilder<ProductsBloc, ProductsState>(builder: (context, state) {
          if (state is ProductsErrorState) {
            return Container(
              child: Center(
                child: CustomText(
                  text: 'sorry we faced some issues',
                ),
              ),
            );
          } else if (state is ProductsSuccessState) {

            return ResponsiveWidget(
              builder: (context, deviceInfo) =>  CustomScrollView(
                slivers: [
                  /******************************************************
                   *       *[Display the product with selected type... ]*
                   ******************************************************/

                  SliverAppBar(
                    floating: true,
                    // pinned: true,
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    automaticallyImplyLeading: false,
                    toolbarHeight:deviceInfo.screenHeight! / 7.5,
                    title: Container(
                        height:deviceInfo.screenHeight!  / 5,
                        width: deviceInfo.screenWidth,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: StaticData()
                              .typesList[index!]
                              .map((_type) => Center(
                                    child: GestureDetector(
                                      child: Card(
                                        color: Color(0xFFE50050),
                                        child: Container(
                                            height: deviceInfo.localHeight! /15,
                                            alignment: Alignment.center,
                                            margin: EdgeInsets.symmetric(
                                                horizontal: deviceInfo.localHeight! /60),
                                            child: CustomText(
                                              text: _type.toUpperCase(),
                                              color: Colors.white,
                                              fontSize: deviceInfo.localHeight!/35,
                                            )),
                                      ),
                                      onTap: () => context
                                          .read<ProductsBloc>()
                                      //Todo : remove this later .... or not
                                          ..add(FetchProductsByCategory(StaticData().categoriesList[index!]))
                                          ..add(FetchProductsByType(_type.toLowerCase())),
                                    ),
                                  ),)
                              .toList(),
                        ),),
                  ),
                  /******************************************************
                  *       *[products GridView]*                         *
                  *******************************************************/
                  SliverGrid(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      if (state.products!.isNotEmpty) {
                        return GestureDetector(

                          child: Card(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Card(
                                  color: Colors.white,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(horizontal:5,vertical: 4),
                                    width: deviceInfo.localWidth!,
                                    height: deviceInfo.localHeight!/2.6,
                                    child: Hero(
                                      tag: state.products![index].image!,

                                      child: Image(
                                        image: NetworkImage(
                                          '${state.products![index].image}',
                                         ),
                                        fit: BoxFit.contain,
                                        height: deviceInfo.localHeight! / 2,
                                        width: deviceInfo.localWidth! ,

                                      ),
                                    ),
                                  ),
                                ),
                                CustomText(
                                 text: state.products![index].title,
                                 fontWeight: FontWeight.bold,
                                 defaultStyle: Theme.of(context)
                                     .textTheme
                                     .headline4!
                                     .apply(
                                       fontFamily: 'Akaya',
                                     )
                                     .copyWith(
                                         fontSize:  deviceInfo.localHeight!/35,
                                         color: context
                                                 .watch<ThemeCubit>()
                                                 .isDarkThemEnabled
                                             ? Colors.white
                                             : Color(0xC11A192F)),
                                  ),
                                CustomText(
                                  text: state.products![index].price.toString() +
                                      ' EGP',
                                  fontWeight: FontWeight.bold,
                                  fontSize:  deviceInfo.localHeight!/30,
                                )
                              ],
                            ),
                          ),
                          onTap: () {
                            Navigator.pushNamed(context, '/Details',arguments: AppArguments(product: state.products![index],));
                          },
                        );
                      } else {
                        return Container(
                          child: CustomText(
                            text: 'no data',
                            fontSize: deviceInfo.localHeight!/55,
                          ),
                        );
                      }
                    }, childCount: state.products!.length ),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio:
                            deviceInfo.mediaQuery!.size.aspectRatio ),
                  ),
                ],
              ),
            );
          } else {
            return Container(
                color: Colors.white10,
                alignment: Alignment.center,
                child: CupertinoActivityIndicator(
                  animating: true,
                  radius: 25,
                ));
          }
        }),
      ),

    );
  }
}
