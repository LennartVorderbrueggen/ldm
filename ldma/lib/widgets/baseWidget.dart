import 'package:flutter/material.dart';
import 'package:ldma/responsive/sizing_information.dart';
import 'package:ldma/responsive/utils/ui_utils.dart';

class BaseWidget extends StatelessWidget {
  final Widget Function(
      BuildContext context, SizingInformation sizingInformation) builder;

  const BaseWidget({Key key, this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return LayoutBuilder(builder: (context, boxconstraints) {
      var sizingInformation = SizingInformation(
          orientation: mediaQuery.orientation,
          deviceScreenType: getDeviceType(mediaQuery),
          screenSize: mediaQuery.size,
          localWidgetSize: Size(boxconstraints.maxWidth, boxconstraints.maxHeight),
      );
      return builder(context, sizingInformation);
    });
  }
}