import 'package:ldma/enums/beverages.dart';

class Order{
  String user;
  Beverages alcohol;
  Beverages softDrink;
  double ratio;

  Order({this.user, this.alcohol, this.softDrink, this.ratio});
  
}