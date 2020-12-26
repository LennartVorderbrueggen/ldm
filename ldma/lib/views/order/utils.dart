import 'dart:convert';
import 'package:ldma/classes/config.dart';
import 'package:ldma/enums/beverages.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../../style.dart';
import '../../theme_changer.dart';
import 'order_view.dart';

Future<http.Response> getResponseFromApi(String specificUrl){
  String baseUrl = "";
  return http.get(baseUrl + specificUrl);
}

// Future<Config> fetchConfig() async {
//   final res = await getResponseFromApi("/config");
//   if(res.statusCode == 200){
//     return Config.fromJson(jsonDecode(res.body));
//   } else{
//     throw Exception("Failed to load Config.");
//   }
// }
Future<Config> fetchConfig() async {
    return Config.fromJson();
}


String imageFactory(Beverages beverage){
    String path = "";
    switch(beverage){
      case Beverages.Jaegermeister:
        path = 'lib/img/alk/product_page_hero_bottle.png';
        break;
      case Beverages.Vodka:
        path = 'lib/img/alk/belvedere-vodka-2017_bear.png';
        break;
      case Beverages.Whiskey:
        path = 'lib/img/alk/jackdaniels_bear.png';
        break;
      case Beverages.CaptainMorgan:
        path = 'lib/img/alk/captain-morgan_bear.png';
        break;
      case Beverages.TequilaGold:
        path = 'lib/img/alk/tequila_bear.png';
        break;
      case Beverages.Gin:
        path = 'lib/img/alk/gin_bear.png';
        break;
      case Beverages.Rum:
        path = 'lib/img/alk/havana-club_bear.png';
        break;
      case Beverages.Korn:
        path = 'lib/img/alk/korn_bear.png';
        break;
      case Beverages.Bacardi:
        path = 'lib/img/alk/bacardi_bear.png';
        break;
      case Beverages.BacardiRazz:
        path = 'lib/img/alk/bacardi-razz_bear.png';
        break;
      case Beverages.DreiUndVierziger:
        path = 'lib/img/alk/43_bear.png';
        break;
      case Beverages.Cola:
        path = 'lib/img/mische/cola_bear.png';
        break;
      case Beverages.Fanta:
        path = 'lib/img/mische/fanta_bear.png';
        break;
      case Beverages.Sprite:
        path = 'lib/img/mische/sprite_bear.png';
        break;
      case Beverages.Orangensaft:
        path = 'lib/img/mische/OJuice_bear.png';
        break;
      case Beverages.Energy:
        path = 'lib/img/mische/redbull.png';
        break;
      case Beverages.Lemon:
        path = 'lib/img/mische/lemon.jpg';
        break;
      case Beverages.Eistee:
        path = 'lib/img/mische/eistee_bear.png';
        break;
      case Beverages.Milch:
        path = 'lib/img/mische/milk_bear.png';
        break;
    }
    return path;
}

List<Widget> getBeverageGrid(List<Beverages> beverages,BuildContext context, bool isAlc)
{
  List<Widget> list = new List<Widget>();
  for(var i = 0; i < beverages.length; i++){
      String selectedBeverage = isAlc ? OrderView.of(context).order.alcohol.toString() : OrderView.of(context).order.softDrink.toString();
      list.add(
        new ButtonTheme(
              key: Key(beverages[i].toString()),
              shape: selectedBeverage == beverages[i].toString() ? Border.all(color: LdmaColors.iconColorDark) : null,
              minWidth: 25,
              height: 10,
              child: RaisedButton(
                animationDuration: Duration(seconds: 2),
                focusColor: Colors.orange,
                color: ThemeBuilder.of(context).darkModeEnabled ? LdmaColors.beverageColorDark : LdmaColors.beverageColorLight,
                highlightColor: LdmaColors.beverageColorDark,
                child: Image.asset(imageFactory(beverages[i])),
                onPressed: (){
                  if(isAlc){
                    OrderView.of(context).order.alcohol = beverages[i];
                  }else{
                    OrderView.of(context).order.softDrink = beverages[i];
                  }              
                  var index = DefaultTabController.of(context).index;
                  DefaultTabController.of(context).animateTo(index+1);},
              ),
            ));
  }
  return list;
}