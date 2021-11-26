import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
class AnswerHome extends StatelessWidget {

  final String text;
  final String users;

  const AnswerHome({@required this.text,@required this.users}):assert(text!=null && users != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(
                left: 10, right: 4, bottom: 15, top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  text,
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.7),
                    fontSize: 17,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                users +' đang hỏi',
                style: TextStyle(
                    color: Colors.black.withOpacity(0.6)),
              ),
              SizedBox(
                width: 20,
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Divider(
            height: 1,
            thickness: 1.5,
            color: getColorFromHex('E2E2E2'),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
