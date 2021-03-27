
import 'package:bag_app/ui/screens/add_and_edit_items/add_new_product.dart';
import 'package:flutter/foundation.dart';
import 'package:bag_app/data/constants/material_data.dart';
import 'package:bag_app/data/models/products.dart';
import 'package:bag_app/logic/cubits/thems/them_cubit.dart';
 import 'package:bag_app/ui/widgets/custom_text.dart';
import 'package:bag_app/ui/widgets/drawer_body_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:bag_app/ui/widgets/my_custom_app_bar.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  final Products product;
  final String tag;

  Details({Key key, @required this.product, this.tag}) : super(key: key);
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Color(0xfffafafa),
      appBar: MyCustomAppBar(
        title: '',
        color:  Color(0xfffafafa),
        textColor: Colors.black,
        actions: [
          //ToDO: will removed later .....
          IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.black,
              size: 32,
            ),
            onPressed: () => _scaffoldKey.currentState.openDrawer(),
          )
        ],
      ),
      drawer: DrawerBodyContent(),
      body: Container(
       width: double.infinity,
       height: ThemeCubit.mediaQuery.size.height * .89,
       child: Stack(
         alignment: Alignment.topCenter,
         children: [
           Hero(
             tag: product.image,
             child: Container(
               padding: EdgeInsets.only(bottom: 20),
               color:  Colors.white,/*Color(0xfffafafF),*/
               height: ThemeCubit.mediaQuery.size.height / 2.35,
               width: ThemeCubit.mediaQuery.size.width,
               child: ExtendedImage(
                 height: ThemeCubit.mediaQuery.size.height /1.5,
                 width: ThemeCubit.mediaQuery.size.width,
                 image: ExtendedNetworkImageProvider(
                     product.image,
                     cache: true,
                     printError: true
                 ),
                 alignment: Alignment.center,
                 fit: BoxFit.contain,
               ),
             ),
           ),
           Align(
             alignment: Alignment(2, 2.15),
             child: Container(
               width: double.infinity,
               height: ThemeCubit.mediaQuery.size.height / 1.7,
               decoration: BoxDecoration(
                 color: Color(int.parse(product.color)),

                 borderRadius: BorderRadius.all(
                   Radius.circular(30),
                 ),
               ),
               child: Container()
             ),
           ),
           Align(
             child: CustomText(
               text: product.price+' EGP',
               color: Colors.black,
               fontSize: 25,
               fontWeight: FontWeight.bold,
             ),
             alignment: Alignment(-.82,-.04),
           ),

           // CustomText(text: product.title)
         ],
       ),
        ),
      floatingActionButton: kIsWeb?FloatingActionButton(
        child: Icon(Icons.edit,size: 22,color: Colors.white,),
        backgroundColor: MaterialData().pinkColor,
        onPressed: () =>Navigator.push(context, MaterialPageRoute(builder: (context) =>
            AddNewProduct(editedProduct: product,),)),

      ):null,
    );
  }
}
