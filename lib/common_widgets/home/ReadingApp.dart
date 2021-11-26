import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class ReadingApp extends StatelessWidget {
  const ReadingApp(
      {@required this.image,
      @required this.header,
      @required this.sizeHeader,
      @required this.text,
      @required this.sizeText,
      @required this.colorHeader,
      @required this.colorText,
      @required this.time})
      : assert(sizeHeader != null && sizeText != null);
  final String image;
  final String header;
  final double sizeHeader;
  final String text;
  final double sizeText;
  final String time;
  final Color colorHeader;
  final Color colorText;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Container(
                width: 80,
                height: 60,
                child: Image(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    header.length <25 ?header :header.substring(0,25)+'...',
                    style: TextStyle(fontSize: sizeHeader, color: colorHeader),
                  ),
                  SizedBox(height: 5,),
                  Container(
                    width: MediaQuery.of(context).size.width - 100,
                    child: Text(text,
                        style: TextStyle(fontSize: sizeText ,color: colorText),),
                  )
                ],
              ),
            ],
          ),
          time!=null ?
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 15, right: 30),
                child: Text(time),
              ),
            ],
          ):SizedBox(height: 10,),
          Padding(
            padding: EdgeInsets.all(8),
            child: Divider(
              height: 1,
              thickness: 1.5,
              color: getColorFromHex('E2E2E2'),
            ),
          ),
          SizedBox(
            height: 5,
          )
        ],
      ),
    );
  }
}
