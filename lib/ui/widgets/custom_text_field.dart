import 'package:bag_app/logic/cubits/thems/them_cubit.dart';
import 'package:bag_app/ui/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String type;
  final Color color;
  final IconData icon;
  final bool isPassword;
  final double height;
  final double width;
  final int maxLines;
  final TextEditingController controller;
  const CustomTextField({Key key, @required this.type, @required this.color, this.icon, this.isPassword, this.controller, this.height, this.width, this.maxLines, })
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Container(

      // margin: EdgeInsets.all( 10),
      width: width??ThemeCubit.mediaQuery.size.width* .9,
      height: height??ThemeCubit.mediaQuery.size.height * .13,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          CustomText(
            text: type,
            fontSize: MediaQuery.of(context).size.width/66,
            color: color,
          ),

          Expanded(
            child: TextField(
              maxLines: maxLines??1,
              controller:controller ,
               obscureText: isPassword??false,
               cursorColor: color,
               style: TextStyle(
                 fontFamily: 'Akaya',
                 fontSize: 20
               ),
               autocorrect: true,
               decoration: InputDecoration(
                   prefixIcon:Icon( icon,color: color,),
                   border: InputBorder.none,
                   fillColor: Color(0xffD7DBDD),
                   filled: true)),
          )
        ],
      ),
    );
  }
}
