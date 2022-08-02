import 'package:bag_app/data/constants/material_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:inner_drawer/inner_drawer.dart';

import 'drawer_body_content.dart';

class MyInnerDrawer extends StatelessWidget {
  final bool isRight;
  final Widget mainScreen;
   static final ZoomDrawerController controller=  ZoomDrawerController();
    MyInnerDrawer({Key? key, this.isRight = false, required this.mainScreen})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    return InnerCustomDrawer(

      controller: controller,
      drawerContent:DrawerBodyContent() ,
      mainScreen: mainScreen,
      menuBackgroundColor: Theme.of(context).brightness ==Brightness.dark?
      MaterialData().pinkColor:MaterialData().blueColor,
      isRight: isRight,

     );
  }
}

