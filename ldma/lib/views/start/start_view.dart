import 'package:flutter/material.dart';
import 'package:ldma/localization/language_constants.dart';
import 'package:ldma/router/route_constants.dart';
import 'package:ldma/widgets/baseWidget.dart';
import 'package:ldma/responsive/sizing_information.dart';

import '../../style.dart';

class StartPage extends StatefulWidget {
  StartPage({Key key}) : super(key: key);

  @override
  _StartPageState createState() => _StartPageState();

  static _StartPageState of(BuildContext context){
    return context.ancestorStateOfType(const TypeMatcher<_StartPageState>());
  }
}

class _StartPageState extends State<StartPage> {
  bool isTextfieldEmpty = true;
  bool showErrorMesssage = false;
  TextEditingController nameController = TextEditingController();
  //SizingInformation sizingInformation;

  @override
  Widget build(BuildContext context) {
    return BaseWidget(builder: (context, sizingInformation) {
        //this.sizingInformation = sizingInformation;
        return Scaffold(
          resizeToAvoidBottomPadding: false,
          body: Container(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("lib/img/generell/loginBackground.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
                children: [
                  SizedBox(
                    height: sizingInformation.localWidgetSize.height*0.1,
                  ),
                  Image(
                    height: sizingInformation.localWidgetSize.height*0.25,
                    image: AssetImage("lib/img/generell/CocktailIcon.png"),
                  ),
                  SizedBox(
                    height: sizingInformation.localWidgetSize.height*0.2,
                  ),
                  Center(
                    child: SizedBox(
                      width: sizingInformation.localWidgetSize.width * 0.5,
                      child: TextField(
                        maxLines: 1,
                        controller: nameController,
                        onChanged: (text) {
                          if (nameController.text != ""){
                            setState(() {
                              isTextfieldEmpty = false;
                              showErrorMesssage = false;
                            });
                          }
                        },
                        onSubmitted: (value) {
                          if (nameController.text == ""){
                            setState(() {
                              isTextfieldEmpty = true;
                              showErrorMesssage = true;
                            });
                          }
                          else{
                            // Navigating to About Page
                            Navigator.pushNamed(context, Routes.orderRoute);
                          }
                        },
                        decoration: new InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Username",
                            //hintText: getTranslated(context, "username"),
                            enabledBorder: UnderlineInputBorder(
                              //borderRadius: BorderRadius.all(Radius.circular(18.0)),
                              borderSide: BorderSide(color: Colors.white, width: 2.0),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white, width: 5.0),
                            ),
                          ),
                      ),
                    ),
                  ),
                  SizedBox(
                    child: Text(
                      (showErrorMesssage) ? "Please enter your name!" : "",
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(
                    height: sizingInformation.localWidgetSize.height*0.1,
                  ),
                  SizedBox(
                    width: sizingInformation.localWidgetSize.width * 0.35,
                    height: sizingInformation.localWidgetSize.height * 0.05,
                    child: ButtonTheme(
                      child: RaisedButton(
                        elevation: 18.0,
                        onPressed: () {
                          if (nameController.text == ""){
                            setState(() {
                              isTextfieldEmpty = true;
                              showErrorMesssage = true;
                            });
                          }
                          else{
                            // Navigating to About Page
                            Navigator.pushNamed(context, Routes.orderRoute);
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
                              Text("Get Started"),
                              SizedBox(width: 10,),
                              Icon(Icons.send),
                          ],),
                        color: Colors.white,
                        ),
            ),
                  ),
                ],
              ),
        ),
        ));
    });
  }
}