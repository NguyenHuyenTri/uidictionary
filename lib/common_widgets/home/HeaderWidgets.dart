import 'package:flutter/material.dart';

class HeaderWidgets extends StatelessWidget {
  const HeaderWidgets(
      {@required this.color,
      @required this.text,
      @required this.paddingTopBottom})
      : assert(paddingTopBottom != null);
  final Color color;
  final String text;
  final double paddingTopBottom;

  @override
  Container build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: paddingTopBottom, top: paddingTopBottom),
      child: Row(
        children: [
          SizedBox(
            width: 10,
          ),
          Text(
            text,
            style: TextStyle(fontSize: 18, color: color),
          ),
        ],
      ),
    );
  }
}
