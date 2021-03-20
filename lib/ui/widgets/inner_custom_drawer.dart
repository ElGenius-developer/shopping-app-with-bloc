import 'package:flutter/material.dart';
import 'package:flutter_inner_drawer/inner_drawer.dart';

import 'drawer_body_content.dart';

class InnerCustomDrawer extends StatelessWidget {
  final bool isRight;
  final Widget mainScreen;
  static  GlobalKey<InnerDrawerState> innerDrawerKey =
      GlobalKey<InnerDrawerState>();

 const InnerCustomDrawer({Key key, this.isRight = false, @required this.mainScreen})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InnerDrawer(
      key: innerDrawerKey,
      borderRadius: 28,
      offset: IDOffset.only(
        bottom: 0.1,
      ),
      onTapClose: true,
      leftAnimationType: InnerDrawerAnimation.quadratic,
      rightAnimationType: InnerDrawerAnimation.quadratic,
      backgroundDecoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      scaffold: mainScreen,
      leftChild: !isRight ? DrawerBodyContent() : null,
      rightChild: isRight ? DrawerBodyContent() : null,
    );
  }
}
