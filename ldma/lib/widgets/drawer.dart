import 'package:flutter/material.dart';
import 'package:ldma/localization/language_constants.dart';
import 'package:ldma/router/route_constants.dart';
import 'package:ldma/style.dart';
import 'package:ldma/theme_changer.dart';

class LdmaDrawer extends Drawer {
  const LdmaDrawer({Key key, ListView child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
            child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: <Widget>[
                Container(
                  child: DrawerHeader(
                      margin: EdgeInsets.zero,
                      padding: EdgeInsets.zero,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image:  AssetImage('lib/img/generell/cocktails.jpg'))),
                      child: Stack(children: <Widget>[
                        // Positioned(
                        //     bottom: 12.0,
                        //     left: 16.0,
                        //     child: Text(getTranslated(context, "title"),
                        //         style: TextStyle(
                        //             color: Colors.black,
                        //             fontSize: 20.0,
                        //             fontWeight: FontWeight.w500))),
                      ])),
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.add, color: ThemeBuilder.of(context).darkModeEnabled ? LdmaColors.iconColorDark : LdmaColors.iconColorLight,),
                  title: Text(getTranslated(context, 'drawerNewOrder')),
                  onTap: () {
                    // To close the Drawer
                    Navigator.pop(context);
                    // Navigating to About Page
                    Navigator.pushNamed(context, Routes.orderRoute);
                  },
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.history, color: ThemeBuilder.of(context).darkModeEnabled ? LdmaColors.iconColorDark : LdmaColors.iconColorLight,),
                  title: Text(getTranslated(context, 'drawerMyHistory')),
                  onTap: () {
                    // To close the Drawer
                    Navigator.pop(context);
                    // Navigating to About Page
                    Navigator.pushNamed(context, Routes.settingsRoute);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.equalizer, color: ThemeBuilder.of(context).darkModeEnabled ? LdmaColors.iconColorDark : LdmaColors.iconColorLight,),
                  title: Text(getTranslated(context, 'drawerRanking')),
                  onTap: () {
                    // To close the Drawer
                    Navigator.pop(context);
                    // Navigating to About Page
                    Navigator.pushNamed(context, Routes.settingsRoute);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.timeline, color: ThemeBuilder.of(context).darkModeEnabled ? LdmaColors.iconColorDark : LdmaColors.iconColorLight,),
                  title: Text(getTranslated(context, 'drawerDrinkingBehavior')),
                  onTap: () {
                    // To close the Drawer
                    Navigator.pop(context);
                    // Navigating to About Page
                    Navigator.pushNamed(context, Routes.settingsRoute);
                  },
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.gamepad, color: ThemeBuilder.of(context).darkModeEnabled ? LdmaColors.iconColorDark : LdmaColors.iconColorLight,),
                  title: Text(getTranslated(context, 'drawerGames')),
                  onTap: () {
                    // To close the Drawer
                    Navigator.pop(context);
                    // Navigating to About Page
                    Navigator.pushNamed(context, Routes.settingsRoute);
                  },
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.settings, color: ThemeBuilder.of(context).darkModeEnabled ? LdmaColors.iconColorDark : LdmaColors.iconColorLight,),
                  title: Text(getTranslated(context, 'drawerSettings')),
                  onTap: () {
                    // To close the Drawer
                    Navigator.pop(context);
                    // Navigating to About Page
                    Navigator.pushNamed(context, Routes.settingsRoute);
                  },
                ),
              ],
            ),
          );
  }
}