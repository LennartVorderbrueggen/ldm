import 'package:flutter/material.dart';
import 'package:ldma/enums/beverages.dart';
import 'package:ldma/localization/language_constants.dart';
import 'package:ldma/style.dart';
import 'package:ldma/theme_changer.dart';
import 'package:ldma/views/order/order_view.dart';
import 'package:ldma/views/order/utils.dart';

class SliderPage extends StatefulWidget{
  @override
  State createState()=> SliderPageState();
}

class SliderPageState extends State<SliderPage>{
  double _currentSliderValue = 20;

  @override
  Widget build(BuildContext context) {
    double buttonHeight = OrderView.of(context).sizingInformation.localWidgetSize.height*0.3;
    double buttonWidht = OrderView.of(context).sizingInformation.localWidgetSize.width*0.4;
    return Scaffold(
      body: Column(children: [
        ButtonBar(
          alignment: MainAxisAlignment.center,
          buttonHeight: 100,
          children: [
            ButtonTheme(
              shape: Border.all(color: OrderView.of(context).order.alcohol == null ? Colors.red : Colors.transparent),
              //shape: Border.all(color: OrderView.of(context).order.alcohol == null ? Colors.red : LdmaColors.iconColorDark),
              height: 150,
              minWidth: 50,
              child: 
                RaisedButton(
                      color: ThemeBuilder.of(context).darkModeEnabled ? LdmaColors.beverageColorDark : LdmaColors.beverageColorLight,
                      highlightColor: LdmaColors.beverageColorDark,
                      child: Image.asset(OrderView.of(context).order.alcohol == null ? "lib/img/generell/questionmarkBox.webp" : imageFactory(OrderView.of(context).order.alcohol), width: buttonWidht, height: buttonHeight,),
                      onPressed: (){
                        DefaultTabController.of(context).animateTo(0);
                      },                         
                ),
              ),
            ButtonTheme(
              shape: Border.all(color: OrderView.of(context).order.softDrink == null ? Colors.red : Colors.transparent),
              //shape: Border.all(color: OrderView.of(context).order.softDrink == null ? Colors.red : LdmaColors.iconColorDark),
              height: 150,
              minWidth: 50,
              child: 
                RaisedButton(
                  color: ThemeBuilder.of(context).darkModeEnabled ? LdmaColors.beverageColorDark : LdmaColors.beverageColorLight,
                  highlightColor: LdmaColors.beverageColorDark,
                  child: Image.asset(OrderView.of(context).order.softDrink == null ? "lib/img/generell/questionmarkBox.webp" : imageFactory(OrderView.of(context).order.softDrink), width: buttonWidht, height: buttonHeight,),
                  onPressed: (){
                    DefaultTabController.of(context).animateTo(1);
                  }                         
                ),
            ),
          ],
        ),
        Slider(
          activeColor: LdmaColors.iconColorDark,
          value: OrderView.of(context).order.ratio,
          min: 0,
          max: 100,
          divisions: 25,
          label: OrderView.of(context).order.ratio.round().toString(),
          onChanged: (double value) {
            setState(() {
              OrderView.of(context).order.ratio = value;
            });
          },
        ),
        SizedBox(height: 100,),
        Container(
          //padding: EdgeInsets.all(75),
          height: 75,
          width: 250,
          child: 
          ButtonTheme(
              child: RaisedButton(
                elevation: 18.0,
                onPressed: () {
                  if(OrderView.of(context).order.alcohol != null && OrderView.of(context).order.softDrink != null && OrderView.of(context).order.user != null){

                  }
                },
                shape: RoundedRectangleBorder(  
                    borderRadius: BorderRadius.circular(18.0),
                ),
                child: 
                Row(
                  mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
                  crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
                  children: [
                      Text(getTranslated(context, "sendOrder")),
                      SizedBox(width: 10,),
                      Icon(Icons.send),
                  ],),
                color: LdmaColors.iconColorDark,
                ),
            ),
        ),
      ],
    ),
    );
  }
}