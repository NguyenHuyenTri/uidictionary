import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class SizeBar extends StatefulWidget {
  final Color color;
  final dynamic drawerKey;

  const SizeBar({@required this.color,@required this.drawerKey});
  @override
  _SizeBarState createState() => _SizeBarState();
}

class _SizeBarState extends State<SizeBar> {

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: widget.color,
      title: Text("Tra cứu"),
      automaticallyImplyLeading: false,
      leading: IconButton(
        onPressed: () {
          widget.drawerKey.currentState.openDrawer();
        },
        icon: Icon(Icons.menu),
      ),
      actions: [
        InkWell(
          child: Image.asset(
            "assets/logo/vietnam.png",
            width: 25,
          ),
          onTap: () {},
        ),
        SizedBox(
          width: 10,
        ),
        IconButton(
            icon: FaIcon(
              FontAwesomeIcons.clock,
              size: 16,
            ),
            onPressed: () {}),
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
