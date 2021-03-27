import 'package:bag_app/logic/cubits/thems/them_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'custom_text.dart';
import 'inner_custom_drawer.dart';

class MyCustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Size size;
  final Color color;
  final Color textColor;

  final bool showDrawer;
  final List<Widget> actions;
  final String title;
  final bool showTrailing;
  const MyCustomAppBar({
    Key key,
    this.size,
    this.showDrawer = false,
    this.showTrailing = false,
    @required this.title,
    this.color, this.actions, this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textColor = this.textColor??(context.watch<ThemeCubit>().isDarkThemEnabled
        ? Colors.white
        : Colors.black);
    return AppBar(
      systemOverlayStyle: Theme.of(context).appBarTheme.systemOverlayStyle,
      elevation: 0,
      automaticallyImplyLeading: false,
      leading: IconButton(
        icon: showDrawer
            ? SvgPicture.asset(
                'images/icons/drawer.svg',
                color: textColor,
                fit: BoxFit.scaleDown,
              )
            : Icon(
                Icons.arrow_back_ios_rounded,
                color: textColor,
                size: 35,
              ),
        onPressed: () => showDrawer
            ? InnerCustomDrawer.innerDrawerKey.currentState.open()
            : Navigator.pop(context),
      ),
      actions: actions??(showTrailing
          ? [
        IconButton(
          icon: Icon(Icons.search, color: textColor, size: 35),
          onPressed: () {},
        ),
      ]
          : []),
      backgroundColor: color ?? context.read<ThemeCubit>().defaultColor,
      title: CustomText(
        fontSize: 25,
        text: title,
        fontWeight: FontWeight.bold,
        color: textColor ?? Colors.white,
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => size ?? Size(double.infinity, 60);
}
