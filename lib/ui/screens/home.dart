import 'package:bag_app/data/constants/static_data.dart';
import 'package:bag_app/logic/blocs/products_bloc/products_bloc.dart';
import 'package:bag_app/logic/cubits/thems/them_cubit.dart';
import 'package:bag_app/ui/adaptive_ui_component/responsive_widget/responsive_widget.dart';
import 'package:bag_app/ui/router/app_arguments.dart';
import 'package:bag_app/ui/widgets/custom_text.dart';
import 'package:bag_app/ui/widgets/inner_custom_drawer.dart';
import 'package:bag_app/ui/widgets/internet_widget.dart';
import 'package:bag_app/ui/widgets/my_custom_app_bar.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'add_and_edit_items/add_new_product.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InnerCustomDrawer(
      mainScreen: Scaffold(
        appBar: MyCustomAppBar(
          title: 'Categories',
          color: Theme.of(context).scaffoldBackgroundColor,
          showDrawer: true,
          showTrailing: true,
        ),
        body: InternetWidget(
          child: ResponsiveWidget(
            builder: (context, deviceInfo)
            {

                      return GridView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: StaticData().categoriesList.length ,
                        itemBuilder: (context, index) => GestureDetector(
                            child: Card(
                              child: Container(
                                width:
                                deviceInfo.screenWidth!*.5,
                                height:
                                deviceInfo.screenHeight! / 3,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    ExtendedImage(
                                      image: AssetImage(
                                        "images/${StaticData().categoriesList[index]}.jpeg",
                                      ),
                                      height:
                                      deviceInfo.localHeight! / 2.2,
                                      width:
                                      deviceInfo.localWidth! *.7,
                                      fit: BoxFit.contain,
                                    ),
                                    SizedBox(height:deviceInfo.localHeight!/50 ,),
                                    CustomText(
                                      text: StaticData()
                                          .categoriesList[index]
                                          .toUpperCase()
                                          .toString(),
                                      fontSize: deviceInfo.localHeight!/50,
                                      fontWeight: FontWeight.bold,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            onTap: () {
                              BlocProvider.of<ProductsBloc>(context)
                                ..add(FetchProductsByCategory(
                                    StaticData().categoriesList[index]));
                              Navigator.pushNamed(context, '/ProductsScreen',
                                  arguments: AppArguments(index: index));
                            }),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio:
                                deviceInfo.mediaQuery!.size.aspectRatio * .9),
                      );
                    })
        ),
        floatingActionButton: kIsWeb?FloatingActionButton(
          child: Icon(CupertinoIcons.add,),
          backgroundColor: Color(0xff22a3ba),
          onPressed: (){
            Navigator.push(context, CupertinoPageRoute(builder: (context) => AddNewProduct(),));
          },
        ):null,


      ),
      isRight: false,
    );
  }
}
