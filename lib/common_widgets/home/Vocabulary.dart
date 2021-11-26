import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class Vocabulary extends StatelessWidget {
  final int index;
  final int lenght;
  final String textJapan;
  final String textVN;
  final VoidCallback onPressed;

  const Vocabulary({@required this.index,@required this.lenght,@required this.textJapan,@required this.textVN,@required this.onPressed})
      : assert(index != null &&
            lenght != null &&
            textJapan != null &&
            textVN != null);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            height: 35,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  textJapan,
                  style: TextStyle(color: Colors.red, fontSize: 18),
                ),
                IconButton(icon: Icon(Icons.volume_down), onPressed: onPressed),
              ],
            ),
          ),
          Row(
            children: [
              Text(
                textJapan,
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Text(
                textVN,
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          index < lenght-1
              ? Divider(
                  height: 1,
                  thickness: 1.5,
                  color: getColorFromHex('E2E2E2'),
                )
              : SizedBox(
                  height: 10,
                ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
