import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bag_app/logic/cubits/thems/them_cubit.dart';
import 'package:bag_app/ui/widgets/custom_text.dart';
import 'package:bag_app/ui/widgets/custom_text_field.dart';
import 'package:bag_app/ui/widgets/sign_button.dart';
import 'package:flutter/material.dart';

class Register extends StatelessWidget {
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.read<ThemeCubit>().alternativeColor,
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
              CustomTextField(type: 'Name', color: context.read<ThemeCubit>().alternativeColor,icon: Icons.person,),
              CustomTextField(type: 'Email', color:  context.read<ThemeCubit>().alternativeColor,icon: Icons.email,),
              CustomTextField(type: 'Password', color: context.read<ThemeCubit>().alternativeColor,icon:Icons.vpn_key_rounded,isPassword: true,),
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
                      color: context.read<ThemeCubit>().alternativeColor,
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
