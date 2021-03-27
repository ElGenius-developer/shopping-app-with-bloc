import 'package:bag_app/data/constants/static_data.dart';
import 'package:bag_app/ui/widgets/custom_text.dart';
import 'package:bag_app/ui/widgets/inner_custom_drawer.dart';
import 'package:bag_app/ui/widgets/my_custom_app_bar.dart';
import 'package:bag_app/ui/widgets/sign_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class Welcoming extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InnerCustomDrawer(
      mainScreen: Scaffold(
        appBar: MyCustomAppBar(
          showDrawer: true,
          title: '',
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        body: Container(
          color: Theme.of(context).scaffoldBackgroundColor,
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
                    child: Image(
                      image: AssetImage(
                        'images/image.png',
                      ),
                      height: constraints.maxHeight * 2,
                      width: constraints.maxWidth * .8,
                    ),
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
                          child:
                              SignButton(namedRoute: '/Login', text: 'Login')),
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
