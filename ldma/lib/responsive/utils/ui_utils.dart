import 'package:flutter/cupertino.dart';
import 'package:ldma/enums/deviceScreenType.dart';

DeviceScreenType getDeviceType(MediaQueryData mediaQueryData){
  var orientation = mediaQueryData.orientation;

  double deviceWidth = 0;

  if(orientation == Orientation.landscape) {
    deviceWidth = mediaQueryData.size.height;
  }else{
    deviceWidth = mediaQueryData.size.width;
  }

  if(deviceWidth > 950){
    return DeviceScreenType.Desktop;
  }
  else if(deviceWidth > 600){
    return DeviceScreenType.Tablet;
  }
  else{
    return DeviceScreenType.Mobile;
  }
}