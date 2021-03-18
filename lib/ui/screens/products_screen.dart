import 'package:bag_app/data/constants/static_data.dart';
import 'package:bag_app/logic/blocs/products_bloc/products_bloc.dart';
import 'package:bag_app/logic/cubits/thems/them_cubit.dart';
import 'package:bag_app/ui/widgets/custom_text.dart';
import 'package:bag_app/ui/widgets/internet_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_view/photo_view.dart';

class ProductsScreen extends StatelessWidget {
  final int index;

  const ProductsScreen(this.index);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
        backgroundColor: context.read<ThemeCubit>().defaultColor,
        title: CustomText(
          fontSize: 25,
          text: StaticData().categoriesList[index].replaceRange(0, 1,
              StaticData().categoriesList[index].toUpperCase().substring(0, 1)),
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        centerTitle: true,
      ),
      body: InternetWidget(
        child:
            BlocBuilder<ProductsBloc, ProductsState>(builder: (context, state) {
          // print(state.props.first);
          if (state is ProductsErrorState) {
            return Container(
              child: Center(
                  child: CustomText(
                text: 'sorry we faced some issues',
              )),
            );
          } else if (state is ProductsSuccessState) {
            return GridView.builder(
              itemCount: state.products.length ?? 0,
              itemBuilder: (context, index) {
                if (state.products.isNotEmpty)
                  return Card(
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(

                          padding: EdgeInsets.all(1),
                          width: ThemeCubit.mediaQuery.size.width - 20,
                          height: ThemeCubit.mediaQuery.size.height / 3,
                          child: Image.network(   state.products[index].image,alignment: Alignment.topCenter,
                          fit: BoxFit.cover,
                          )
                    /*      PhotoView(
                            imageProvider: NetworkImage(
                              state.products[index].image,
                            ),
                            loadingBuilder: (context, event) =>
                                CupertinoActivityIndicator(),

                            *//*
                        height: ThemeCubit.mediaQuery.size.height / 4,
                        width: ThemeCubit.mediaQuery.size.width / 2.5,*//*
                            errorBuilder: (context, error, stackTrace) =>
                                Icon(CupertinoIcons.exclamationmark_triangle),

*//*
                        fit: BoxFit.fill,
*//*
                          ),*/
                        ),
                        CustomText(
                          text: state.products[index].price.toString() + ' EGP',
                          fontWeight: FontWeight.bold,
                        )
                      ],
                    ),
                  );
                else
                  return Container(
                    child: CustomText(
                      text: 'no data',
                    ),
                  );
              },
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio:
                      ThemeCubit.mediaQuery.size.aspectRatio * 1.2),
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
