import 'package:flutter/material.dart';

class LdmaAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color backgroundColor = Colors.orange;
  final Text title;
  final AppBar appBar;
  final List<Widget> widgets;

  /// you can add more fields that meet your needs

  const LdmaAppBar({Key key, this.title, this.appBar, this.widgets})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: title,
      flexibleSpace: Image(
          image: AssetImage('lib/img/generell/gradient.png'),
          fit: BoxFit.cover,
        ),
      backgroundColor: Colors.transparent,
      actions: widgets,
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
}