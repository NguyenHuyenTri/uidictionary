import 'package:flutter/material.dart';

class FooterMoreWigets extends StatelessWidget {
  const FooterMoreWigets({@required this.color,@required  this.paddingBottom})
      : assert(paddingBottom != null);

  final Color color;
  final double paddingBottom;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Padding(
        padding: EdgeInsets.only(bottom: paddingBottom),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'Xem thêm',
              style: TextStyle(color: color, fontSize: 16),
            ),
            SizedBox(
              width: 20,
            )
          ],
        ),
      ),
    );
  }
}
