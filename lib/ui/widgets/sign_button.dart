import 'package:bag_app/logic/cubits/thems/them_cubit.dart';
import 'package:bag_app/ui/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignButton extends StatelessWidget {
  final String namedRoute;
  final String text;
  final Function function;
  SignButton({Key key, this.namedRoute, @required this.text, this.function})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CupertinoButton(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
              gradient: LinearGradient(
                  colors: text.toLowerCase().contains('login')
                      ? pinkList
                      : blueList)),
          width: ThemeCubit.mediaQuery.size.width / 1.2,
          height: ThemeCubit.mediaQuery.size.height * 0.06,
          alignment: Alignment.center,
          child: CustomText(
            text: text,
            fontSize: 22,
            color: Theme.of(context).textSelectionTheme.cursorColor,
          ),
        ),
        onPressed: () {
          function ??
              Navigator.of(
                context,
              ).pushNamed(namedRoute);
        },
      ),
    );
  }

  final blueList = [
    Colors.blueAccent,
    Colors.lightBlue,
    Colors.lightBlue,
    Colors.blue,
    Colors.blue.shade700
  ];
  final pinkList = [
    Colors.pink,
    Colors.pinkAccent,
    Colors.pinkAccent,
    Colors.pink.shade600,
    Colors.pink.shade700
  ];
}
