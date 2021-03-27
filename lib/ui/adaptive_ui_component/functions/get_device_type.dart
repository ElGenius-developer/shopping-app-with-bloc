import 'package:bag_app/ui/adaptive_ui_component/enums/device_type_enum.dart';
import 'package:flutter/cupertino.dart';

DeviceType getDeviceType(MediaQueryData mediaQueryData) {
  Orientation orientation = mediaQueryData.orientation;
  double width = 0;
  switch (orientation) {
    case Orientation.landscape:
      width = mediaQueryData.size.height;
      break;
    case Orientation.portrait:
      width = mediaQueryData.size.width;
      break;
  }
  if (width >= 900) {
    return DeviceType.Desktop;
  } else if (width >= 600) {
    return DeviceType.Tablet;
  } else if (width <= 200) {
    return DeviceType.Watch;
  } else {
    return DeviceType.Mobile;
  }
}
