import 'package:flutter/material.dart';
import 'package:ldma/classes/order.dart';
import 'package:ldma/enums/beverages.dart';
import 'package:ldma/localization/language_constants.dart';
import 'package:ldma/router/route_constants.dart';
import 'package:ldma/style.dart';
import 'package:ldma/theme_changer.dart';
import 'package:ldma/widgets/appBar.dart';
import 'package:ldma/widgets/baseWidget.dart';
import 'package:ldma/widgets/drawer.dart';


class OrderView extends StatefulWidget {
  OrderView({Key key}) : super(key: key);



  @override
  _OrderViewState createState() => _OrderViewState();


    static _OrderViewState of(BuildContext context)
  {
    return context.ancestorStateOfType(const TypeMatcher<_OrderViewState>());
  }
}

class _OrderViewState extends State<OrderView> {
  Order order = new Order();

  @override
  Widget build(BuildContext context) {
    return BaseWidget(builder: (context, sizingInformation) {
        return Scaffold(
          appBar: LdmaAppBar(
            title: Text(getTranslated(context, 'title')),
            appBar: AppBar(),
          ),
          drawer: LdmaDrawer(),
            body: new DefaultTabController(
              length: 3,
              child: Builder(builder: (BuildContext context) {
                return Scaffold(
                  body: TabBarView(
                        children: [
                          new Container(
                            //Order Page 1 generel information
                            margin: const EdgeInsets.only(top:50.0),
                            child: Container(//child:
                                    //AlkPage(order),
                            ),
                          ),
                          new Container(
                            //Order Page 1 generel information
                            margin: const EdgeInsets.only(top:50.0),
                            child: Container(//child:
                                      //MischePage(),
                            ),
                          ),
                          new Container(
                            //Order Page 1 generel information
                            margin: const EdgeInsets.only(top:50.0),
                            child: Container(//child:
                                      //SliderPage(),
                            ),
                          ),
                        ],
                      ),
                      appBar: TabBar(
                    tabs: [
                      Tab(
                        text: (getTranslated(context, "alcohol")),
                        icon: new ImageIcon(
                          AssetImage('lib/img/icons/icons8-whiskey-64.png'),
                        )
                      ),
                      Tab(
                        text: (getTranslated(context, "softDrink")),
                        icon: new ImageIcon(
                          AssetImage('lib/img/icons/icons8-limonade-50.png'),
                        )
                      ),
                      Tab(
                        text: (getTranslated(context, "ratio")),
                        icon: new ImageIcon(
                          AssetImage('lib/img/icons/icons8-waage-50.png'),
                        )
                      ),
                    ],
                    
                    labelColor: LdmaColors.iconColorDark,
                    unselectedLabelColor: ThemeBuilder.of(context).darkModeEnabled ? Colors.white : Colors.black,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorPadding: EdgeInsets.all(5.0),
                    indicatorColor: LdmaColors.iconColorDark,
                  ),
                  
                    );
                  }
        )));
      },
    );
  }
}