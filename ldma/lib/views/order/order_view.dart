import 'package:flutter/material.dart';
import 'package:ldma/theme_changer.dart';
import 'package:ldma/widgets/baseWidget.dart';


class OrderView extends StatefulWidget {
  OrderView({Key key}) : super(key: key);

  @override
  _OrderViewState createState() => _OrderViewState();
}

class _OrderViewState extends State<OrderView> {
  

  @override
  Widget build(BuildContext context) {
    return BaseWidget(builder: (context, sizingInformation) {
        return Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(sizingInformation.toString()),
              ],
         ),
        );
      },
    );
  }
}