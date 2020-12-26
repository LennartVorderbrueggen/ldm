import 'package:flutter/material.dart';
import 'package:ldma/enums/beverages.dart';
import 'package:ldma/style.dart';
import 'package:ldma/theme_changer.dart';
import 'package:ldma/views/order/utils.dart';

class MischePage extends StatefulWidget{
  MischePage(
    this.softdrink,
  );
  List<Beverages> softdrink;

  @override
  State createState()=> MischePageState();
}

class MischePageState extends State<MischePage>{
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
              primary: false,
              slivers: <Widget>[
                SliverPadding(
                  padding: const EdgeInsets.all(20),
                  sliver: SliverGrid.count(
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 75,
                    crossAxisCount: 2,
                    children: getBeverageGrid(this.widget.softdrink,context, false)
                  ),
                ),
              ],
            );
  }
}