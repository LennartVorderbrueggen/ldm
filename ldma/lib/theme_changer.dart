import 'package:flutter/material.dart';

class ThemeBuilder extends StatefulWidget {

  final Widget Function(BuildContext context, Brightness brightness) builder;

  const ThemeBuilder({Key key, this.builder}) : super(key: key);
  @override
  _ThemeBuilderState createState() => _ThemeBuilderState();

  static _ThemeBuilderState of(BuildContext context)
  {
    return context.ancestorStateOfType(const TypeMatcher<_ThemeBuilderState>());
  }
}

class _ThemeBuilderState extends State<ThemeBuilder> {
  Brightness _brightness;
  bool darkModeEnabled = false;

  @override
  void initState() {
    super.initState();
    _brightness = Brightness.light;
  }

  void changeTheme(){
    setState(() {
      _brightness = _brightness == Brightness.dark ? Brightness.light : Brightness.dark;
      darkModeEnabled = !darkModeEnabled;
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context,_brightness);
  }
}