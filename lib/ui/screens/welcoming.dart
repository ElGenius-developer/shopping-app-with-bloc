import 'package:bag_app/data/constants/static_data.dart';
import 'package:bag_app/logic/cubits/thems/them_cubit.dart';
import 'package:bag_app/ui/widgets/custom_text.dart';
import 'package:bag_app/ui/widgets/internet_widget.dart';
import 'package:bag_app/ui/widgets/sign_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class Welcoming extends StatelessWidget {
  final _scaffoldKey=GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    ThemeCubit.mediaQuery = MediaQuery.of(context);
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        systemOverlayStyle: Theme.of(context).appBarTheme.systemOverlayStyle,
           backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          automaticallyImplyLeading: false,
          leading:IconButton(
            icon:  SvgPicture.asset(
              'images/icons/drawer.svg',
              color: Theme.of(context).textSelectionTheme.selectionColor,
              fit: BoxFit.scaleDown,

            ),
            onPressed: () =>_scaffoldKey.currentState.openDrawer(),
          )
      ),
      drawer: Drawer(
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
          )
      ),
      body: InternetWidget(
        //use to check internet connection with simple widget
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: FractionallySizedBox(
            heightFactor: 1,
            widthFactor: 1,
            child: LayoutBuilder(
              builder: (context, constraints) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomText(
                    color: Colors.purple,
                    fontSize: 40,
                    text: 'Welcome',
                  ),
                  //Image
                  Container(
                    height: constraints.maxHeight * .45,
                    width: constraints.maxWidth,
                    child: Image(image: AssetImage(
                      'images/image.png',
                    ),
                      height: constraints.maxHeight * 2,
                      width: constraints.maxWidth * .8,),

                  ),
                  Container(
                    width: constraints.maxWidth * .8,
                    height: constraints.maxHeight * .2,
                    child: Swiper(
                      autoplayDelay: 6000,
                      itemCount: StaticData().sentences.length,
                      curve: Curves.elasticIn,
                      duration: 250,
                      autoplay: true,
                      pagination: SwiperPagination(
                          builder: DotSwiperPaginationBuilder(
                              activeColor: Colors.pink.shade400,
                              color: Colors.grey.shade400,
                              activeSize: 12)),
                      itemBuilder: (context, index) => CustomText(
                        fontSize: 22,
                        text: StaticData().sentences[index],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                          child: SignButton(
                              namedRoute: '/Login', text: 'Login')),
                      Expanded(
                          child: SignButton(
                              namedRoute: '/SignUp', text: 'Sign up'))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
