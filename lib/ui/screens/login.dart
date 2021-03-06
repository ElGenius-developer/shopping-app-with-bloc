 import 'package:bag_app/logic/cubits/thems/them_cubit.dart';
import 'package:bag_app/ui/widgets/custom_text.dart';
import 'package:bag_app/ui/widgets/custom_text_field.dart';
import 'package:bag_app/ui/widgets/sign_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sign_button/constants.dart';
import 'package:sign_button/create_button.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: context.read<ThemeCubit>().defaultColor,
        title: CustomText(
          fontSize: 25,
          text: 'Login',
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(vertical: 25),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 1.2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextField(
                type: 'Email',
                color: context.read<ThemeCubit>().defaultColor,
                icon: Icons.email,
              ),
              CustomTextField(
                type: 'Password',
                color: context.read<ThemeCubit>().defaultColor,
                icon: Icons.vpn_key,
                isPassword: true,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: CustomText(
                  color: context.read<ThemeCubit>().defaultColor,
                  text: 'Forget Password',
                  fontSize: 22,
                ),
              ),
              SignButton(
                  function: () {
                    print("asdasdasd");
                  },
                  text: 'Login'),
              //Divider
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  customDivider(context),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: CustomText(
                      text: 'OR',
                      fontSize: 15,
                    ),
                  ),
                  customDivider(context),
                ],
              ),

              SignInButton(
                buttonType: ButtonType.google,
                onPressed: () {},
                buttonSize: ButtonSize.large,
              ),
              SizedBox(
                height: 15,
              ),
              SignInButton(
                buttonType: ButtonType.facebook,
                onPressed: () {},
                buttonSize: ButtonSize.large,
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    fontSize: 22,
                    text: "Don't have account?",
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  //TODO:will add functionality later
                  GestureDetector(
                    child: CustomText(
                      fontSize: 22,
                      text: "Register",
                      color: context.read<ThemeCubit>().defaultColor,
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

  Widget customDivider(BuildContext context) => Container(
      color: Theme.of(context).textSelectionTheme.selectionColor,
      height: 1,
      width: ThemeCubit.mediaQuery.size.width / 3);
}
