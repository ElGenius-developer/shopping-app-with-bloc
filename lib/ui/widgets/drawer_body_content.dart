import 'package:bag_app/logic/cubits/thems/them_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'custom_text.dart';

class DrawerBodyContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Material(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomText(text: 'Change Theme',fontWeight: FontWeight.bold,fontSize: 22,
            color: context.watch<ThemeCubit>().isDarkThemEnabled?
            context.read<ThemeCubit>().defaultColor: context.read<ThemeCubit>().alternativeColor,),
          Container(
            margin: EdgeInsets.all(10),
            child: Switch(
              activeColor: context.read<ThemeCubit>().defaultColor,
              inactiveThumbColor: context.read<ThemeCubit>().alternativeColor,
              inactiveTrackColor: context.read<ThemeCubit>().alternativeColor,
              value: context.watch<ThemeCubit>().isDarkThemEnabled,
              onChanged: (bool value) {
                if(value)context.read<ThemeCubit>().switchThem(ThemeMode.dark);
                else context.read<ThemeCubit>().switchThem(ThemeMode.light);
              },

            ),
          ),
        ],
      ),
    );
  }
}
