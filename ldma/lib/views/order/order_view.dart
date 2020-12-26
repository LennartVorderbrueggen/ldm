import 'package:flutter/material.dart';
import 'package:ldma/classes/config.dart';
import 'package:ldma/classes/order.dart';
import 'package:ldma/enums/beverages.dart';
import 'package:ldma/localization/language_constants.dart';
import 'package:ldma/responsive/sizing_information.dart';
import 'package:ldma/router/route_constants.dart';
import 'package:ldma/style.dart';
import 'package:ldma/theme_changer.dart';
import 'package:ldma/views/order/alkohol_view.dart';
import 'package:ldma/views/order/ratio_view.dart';
import 'package:ldma/views/order/softDrink_view.dart';
import 'package:ldma/views/order/utils.dart';
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
  Future<Config> config;
  Order order = new Order(alcohol: null, softDrink: null, ratio: 20, user: null);
  SizingInformation sizingInformation;

  @override
  void initState() { 
    super.initState();
    config = fetchConfig();
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidget(builder: (context, sizingInformation) {
        this.sizingInformation = sizingInformation;
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
                            child: FutureBuilder<Config>(
                              future: config,
                              builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    //return Text(snapshot.data.numActivePumps.toString());
                                    return AlkPage(snapshot.data.alcohol);
                                  } else if (snapshot.hasError) {
                                    return Text("${snapshot.error}");
                                  }

                                  // By default, show a loading spinner.
                                  return CircularProgressIndicator();
                                },
                            ),
                          ),
                          new Container(
                            //Order Page 1 generel information
                            margin: const EdgeInsets.only(top:50.0),
                            child: FutureBuilder<Config>(
                              future: config,
                              builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    //return Text(snapshot.data.numActivePumps.toString());
                                    return MischePage(snapshot.data.softDrink);
                                  } else if (snapshot.hasError) {
                                    return Text("${snapshot.error}");
                                  }

                                  // By default, show a loading spinner.
                                  return CircularProgressIndicator();
                                },
                            ),
                          ),
                          new Container(
                            //Order Page 1 generel information
                            margin: const EdgeInsets.only(top:50.0),
                            child: FutureBuilder<Config>(
                              future: config,
                              builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    //return Text(snapshot.data.numActivePumps.toString());
                                    return SliderPage();
                                  } else if (snapshot.hasError) {
                                    return Text("${snapshot.error}");
                                  }

                                  // By default, show a loading spinner.
                                  return CircularProgressIndicator();
                                },
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