import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vietnhat/shares/share.dart';

class AppBarMenu extends StatelessWidget {
  final String textMenu;
  const AppBarMenu( { @required this.textMenu});
  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
    return AppBar(
      backgroundColor: mainBackGroundHome,
      title: Text(textMenu),
      automaticallyImplyLeading: false,
      leading: IconButton(
        onPressed: () {
          _drawerKey.currentState.openDrawer();
        },
        icon: Icon(Icons.menu),
      ),
      actions: [
        IconButton(
            icon: FaIcon(
              FontAwesomeIcons.cog,
              size: 16,
            ),
            onPressed: () {}),
      ],
    );
  }
}
