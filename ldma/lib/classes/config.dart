import 'package:ldma/enums/beverages.dart';

class Config {
  final int numActivePumps;
  final int volumeCup;
  final List<Beverages> alcohol;
  final List<Beverages> softDrink;

  Config({this.numActivePumps, this.volumeCup, this.alcohol, this.softDrink});

  // factory Config.fromJson(Map<String, dynamic> json){
  //   final List<Beverages> _alcohol = new List();
  //   final List<Beverages> _softDrink = new List();
  //   final List<String> pumps = ["pump1","pump2","pump3","pump4","pump5","pump6"];
  //   for (var pump in pumps) {
  //     isAlcohol(json[pump]) ? _alcohol.add(getBeverage(json[pump])) : _softDrink.add(getBeverage(json[pump]));
  //   }
  //   return Config(numActivePumps: json["numActivePumps"],
  //                 volumeCup: json["volumeCup"], 
  //                 alcohol: _alcohol, 
  //                 softDrink: _softDrink);
  // }
  factory Config.fromJson(){
  final List<Beverages> _alcohol = new List();
  final List<Beverages> _softDrink = new List();
  _alcohol.add(Beverages.Jaegermeister);
  _alcohol.add(Beverages.Vodka);
  _alcohol.add(Beverages.Korn);
  _softDrink.add(Beverages.Cola);
  _softDrink.add(Beverages.Fanta);
  _softDrink.add(Beverages.Orangensaft);
  return Config(numActivePumps: 6,
                volumeCup: 250, 
                alcohol: _alcohol, 
                softDrink: _softDrink);
  }
}

bool isAlcohol(String beverage){
  for (var alcohol in Alcohol.values) {
    if(beverage == alcohol.toString())
      return true;
  }
  for (var softDrink in SoftDrinks.values) {
    if(beverage == softDrink.toString())
      return false;
  }
  return null;
}

Beverages getBeverage(String beverage){
  for (var bev in Beverages.values) {
    if(bev.toString() == beverage){
      return bev;
    }
  }
  return null;
}