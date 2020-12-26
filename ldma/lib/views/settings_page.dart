import 'package:flutter/material.dart';
import 'package:ldma/classes/language.dart';
import 'package:ldma/localization/language_constants.dart';
import 'package:ldma/main.dart';
import 'package:ldma/widgets/appBar.dart';
import 'package:ldma/widgets/drawer.dart';

import '../theme_changer.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({Key key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  void _changeLanguage(Language language) async {
    Locale _locale = await setLocale(language.languageCode);
    MyApp.setLocale(context, _locale);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LdmaAppBar(
        title: Text(getTranslated(context, "title")),
        appBar: AppBar(),),
      drawer: LdmaDrawer(),
      body: Container(
        child: Column(children: [
        Center(
            child: DropdownButton<Language>(
          iconSize: 30,
          hint: Text(getTranslated(context, 'changelanguage')),
          onChanged: (Language language) {
            _changeLanguage(language);
          },
          items: Language.languageList()
              .map<DropdownMenuItem<Language>>(
                (e) => DropdownMenuItem<Language>(
                  value: e,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        e.flag,
                        style: TextStyle(fontSize: 30),
                      ),
                      Text(e.name)
                    ],
                  ),
                ),
              )
              .toList(),
        )),
        Center(
          child: Switch(
            value: ThemeBuilder.of(context).darkModeEnabled,
            onChanged: (value) {
              setState(() {
                ThemeBuilder.of(context).changeTheme();
                ThemeBuilder.of(context).darkModeEnabled = value;
              });
            },
            activeTrackColor: Colors.lightGreenAccent,
            activeColor: Colors.green,
          ),
        ),
        // TODO: feaure: possibility to change name
        ],),
      ),
    );
  }
}
