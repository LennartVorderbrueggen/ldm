import 'package:ldma/enums/beverages.dart';

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