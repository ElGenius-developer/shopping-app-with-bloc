 import 'package:bag_app/ui/adaptive_ui_component/device_model/device_info.dart';
import 'package:bag_app/ui/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class ScrollRowTextFieldForAdd extends StatelessWidget {
  final String type1;
  final String type2;
  final TextEditingController controller1;
  final TextEditingController controller2;
  final int number;
  final String type3;
  final DeviceInfo deviceInfo;
  final TextEditingController controller3;
  ScrollRowTextFieldForAdd(
      this.type1, this.type2, this.controller1, this.controller2, this.number,
      {this.type3, this.controller3,@required this.deviceInfo });
  @override
  Widget build(BuildContext context) {
    var children = <Widget>[];
    if (number == 3) {
      children = [
        CustomTextField(
          type: type1,
          color: Colors.pink,
          controller: controller1,
          height:    deviceInfo.localHeight *.1,
          width: deviceInfo.localWidth / 3.5 ,
        ),
        SizedBox(
          width: deviceInfo.localWidth/42,
        ),
        CustomTextField(
          type: type2,
          color: Colors.pink,
          controller: controller2,
          height:    deviceInfo.localHeight *.1,
          width: deviceInfo.localWidth / 3.5,

        ),
        SizedBox(
          width: deviceInfo.localWidth/42,
        ),
        CustomTextField(
          type: type3,
          color: Colors.pink,
          controller: controller3,
          height:    deviceInfo.localHeight *.1,
          width: deviceInfo.localWidth/ 3.5,
        ),
      ];
    } else if (number == 2) {
      children = [
        CustomTextField(
          width: deviceInfo.localWidth/ 2.3,
          height:    deviceInfo.localHeight *.1,
          type: type1,
          color: Colors.pink,
          controller: controller1,
        ),
        SizedBox(
          width: deviceInfo.localWidth/26.1818,
        ),
        CustomTextField(
          width: deviceInfo.localWidth/ 2.3,
          height:    deviceInfo.localHeight *.1,
          type: type2,
          color: Colors.pink,
          controller: controller2,
        ),
      ];
    }
    return Container(
      height: deviceInfo.localHeight*.12,
      width: deviceInfo.localWidth,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: children),
    );
  }
}
