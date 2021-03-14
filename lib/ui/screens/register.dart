import 'package:bag_app/data/constants/static_data.dart';
import 'package:bag_app/logic/cubits/thems/them_cubit.dart';
import 'package:bag_app/ui/widgets/custom_text.dart';
import 'package:bag_app/ui/widgets/custom_text_field.dart';
import 'package:bag_app/ui/widgets/sign_button.dart';
import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  final _color=StaticData().blueColor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _color,
        title: CustomText(
          fontSize: 25,
          text: 'Sign Up',
          color: Colors.white,
        ),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        height: ThemeCubit.mediaQuery.size.height / 1,
        width: ThemeCubit.mediaQuery.size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomTextField(type: 'Name', color: _color,icon: Icons.person,),
              CustomTextField(type: 'Email', color:  _color,icon: Icons.email,),
              CustomTextField(type: 'Password', color: _color,icon:Icons.vpn_key_rounded,isPassword: true,),
              SignButton(text: 'SignUp'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    text: 'Already have account?',
                  ),
                  SizedBox(width: 10,),
                  GestureDetector(
                    //TODO:will add functionality later
                    child: CustomText(
                      text: 'Login',
                      color: _color,
                      fontSize: 21,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
