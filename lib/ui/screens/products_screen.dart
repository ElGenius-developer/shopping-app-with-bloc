import 'package:bag_app/data/constants/static_data.dart';
import 'package:bag_app/logic/blocs/products_bloc/products_bloc.dart';
import 'package:bag_app/logic/cubits/thems/them_cubit.dart';
import 'package:bag_app/ui/widgets/custom_text.dart';
import 'package:bag_app/ui/widgets/internet_widget.dart';
import 'package:bag_app/ui/widgets/my_custom_app_bar.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsScreen extends StatelessWidget {
  final int index;

  const ProductsScreen(this.index);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyCustomAppBar(
        title: StaticData().categoriesList[index].replaceRange(0, 1,
            StaticData().categoriesList[index].toUpperCase().substring(0, 1)),
        color: Theme.of(context).scaffoldBackgroundColor,
        showTrailing: true,
      ),
      body: InternetWidget(
        child:
            BlocBuilder<ProductsBloc, ProductsState>(builder: (context, state) {
          if (state is ProductsErrorState) {
            return Container(
              child: Center(
                  child: CustomText(
                text: 'sorry we faced some issues',
              )),
            );
          } else if (state is ProductsSuccessState) {
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  floating: true,
                  // pinned: true,
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  automaticallyImplyLeading: false,
                  toolbarHeight: ThemeCubit.mediaQuery.size.height / 7.5,
                  title: Container(
                      height: ThemeCubit.mediaQuery.size.height / 5,
                      width: double.infinity,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: StaticData()
                            .typesList[index]
                            .map((_type) => Center(
                                  child: GestureDetector(
                                    child: Card(
                                      color: Color(0xFFE50050),
                                      child: Container(
                                          height: 50,
                                          alignment: Alignment.center,
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 12),
                                          child: CustomText(
                                            text: _type.toUpperCase(),
                                            color: Colors.white,
                                          )),
                                    ),
                                    onTap: () => context
                                        .read<ProductsBloc>()
                                        .add(FetchProductsByType(_type)),
                                  ),
                                ))
                            .toList(),
                      )),
                ),
                SliverGrid(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    if (state.products.isNotEmpty)
                      return Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Card(
                              color: Colors.white,
                              child: ExtendedImage(
                                image: ExtendedNetworkImageProvider(
                                  state.products[index].image,
                                  timeRetry: Duration(seconds: 7),
                                ),
                                height: ThemeCubit.mediaQuery.size.height / 3.2,
                                width: double.infinity,
                                enableMemoryCache: true,
                                handleLoadingProgress: true,
                                enableLoadState: true,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10, bottom: 15),
                              child: CustomText(
                                text: state.products[index].title,
                                fontWeight: FontWeight.bold,
                                defaultStyle: Theme.of(context)
                                    .textTheme
                                    .headline4
                                    .apply(
                                      fontFamily: 'Akaya',
                                    )
                                    .copyWith(
                                        fontSize: 20,
                                        color: context
                                                .watch<ThemeCubit>()
                                                .isDarkThemEnabled
                                            ? Colors.white
                                            : Color(0xC11A192F)),
                              ),
                            ),
                            CustomText(
                              text: state.products[index].price.toString() +
                                  ' EGP',
                              fontWeight: FontWeight.bold,
                            )
                          ],
                        ),
                      );
                    else {
                      return Container(
                        child: CustomText(
                          text: 'no data',
                        ),
                      );
                    }
                  }, childCount: state.products.length ?? 0),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio:
                          ThemeCubit.mediaQuery.size.aspectRatio * 1.1),
                ),
              ],
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
