import 'package:bag_app/ui/adaptive_ui_component/device_model/device_info.dart';
import 'package:bag_app/ui/adaptive_ui_component/functions/get_device_type.dart';
import 'package:flutter/material.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget Function(BuildContext context, DeviceInfo deviceInfo)? builder;

  const ResponsiveWidget({Key? key, this.builder}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Container(
      width: mediaQuery.size.width,
      height: mediaQuery.size.height,
      child: LayoutBuilder(
        builder: (context, constraints) {
          var deviceInfo = DeviceInfo(
            deviceType: getDeviceType(
              mediaQuery,
            ),
            screenHeight: mediaQuery.size.height,
            screenWidth: mediaQuery.size.width,
            localHeight: constraints.maxHeight,
            localWidth: constraints.maxWidth,
            orientation: mediaQuery.orientation,
            mediaQuery: mediaQuery
          );
          return Container(
              height: mediaQuery.size.height,
              width: mediaQuery.size.width,
              child: builder!(context, deviceInfo));
        },
      ),
    );
  }
}
