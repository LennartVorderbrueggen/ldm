import 'package:flutter/cupertino.dart';
import 'package:ldma/enums/deviceScreenType.dart';

class SizingInformation {
  final Orientation orientation;
  final DeviceScreenType deviceScreenType;
  final Size screenSize;
  final Size localWidgetSize;

  SizingInformation({this.orientation, this.deviceScreenType, this.screenSize, this.localWidgetSize});

  @override
  String toString() {
    // TODO: implement toString
    return "Orientation: " + this.orientation.toString() + "; DeviceScreenType: " + this.deviceScreenType.toString() + "; ScreenSize: " + this.screenSize.toString() + "; LocalWidgetSize: " + this.localWidgetSize.toString();
  }
}