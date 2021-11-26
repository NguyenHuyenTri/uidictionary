import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:vietnhat/shares/share.dart';
import 'package:vietnhat/data/data.dart';
import 'package:vietnhat/common_widgets/export_common_widgets.dart';
class JLPTPage extends StatefulWidget {
  @override
  _JLPTPageState createState() => _JLPTPageState();
}

class _JLPTPageState extends State<JLPTPage> {
  Color brownColor = getColorFromHex("F2F2F2");
  Color buttonTop = getColorFromHex('C6C6C6');
  Color gridColor = getColorFromHex('808080');
  String _selectedValue = '';

  String _select1 = JLPT[0];
  String _select2 = trinhDo[0];
  int _select3 = 1;
  List dataSelect = [];

  List<bool> checked = [true, true];
  List<String> checkedText = ['Từ','Nghĩa'];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    //1 widgets one
    Container buildTop(Size size) {
      InkWell buildButtonTop(double widthText, double widthIcon, double height,
          String text, int index) {
        return InkWell(
          onTap: () {
            setState(() {
              switch (index) {
                case 1:
                  {
                    dataSelect = JLPT;
                  }
                  break;
                case 2:
                  {
                    dataSelect = trinhDo;
                  }
                  break;
                default:
                  {
                    dataSelect = ['1', '2', '3', '4', '5', '6', '7'];
                  }
                  break;
              }
            });
            _showPicker(context, index);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  width: widthText,
                  decoration: BoxDecoration(
                      color: buttonTop,
                      // borderRadius: BorderRadius.circular(10),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(7.0),
                        bottomLeft: Radius.circular(7.0),
                      )),
                  alignment: Alignment.centerLeft,
                  height: height,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                      text,
                      style: TextStyle(fontSize: 18),
                    ),
                  )),
              Container(
                width: widthIcon,
                decoration: BoxDecoration(
                    color: getColorFromHex('555555'),
                    // borderRadius: BorderRadius.circular(10),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(7.0),
                      bottomRight: Radius.circular(7.0),
                    )),
                height: height,
                child: Icon(
                  Icons.arrow_drop_down,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        );
      }

      return Container(
        color: brownColor,
        width: size.width,
        child: Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 8, left: 4, right: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildButtonTop(size.width * 0.28, 25, 40, _select1, 1),
              buildButtonTop(size.width * 0.24, 25, 40, _select2, 2),
              buildButtonTop(size.width * 0.20, 25, 40, _select3.toString(), 3),
            ],
          ),
        ),
      );
    }
    //2 widgets two

    Padding buildPlashCard(Size size, String row1Title, String row1Text,
        IconData row1Icon, String row2Title, row2Text, IconData row2Icon) {
      return Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Wrap(
          children: [
            Container(
              width: size.width * 0.48,
              height: 90,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    row1Icon,
                    color: gridColor,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    row1Title,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 16),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    row1Text,
                    style: TextStyle(color: getColorFromHex('989898')),
                  )
                ],
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Container(
              width: size.width * 0.48,
              height: 90,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    row2Icon,
                    color: gridColor,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    row2Title,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 16),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    row2Text,
                    style: TextStyle(color: getColorFromHex('989898')),
                  )
                ],
              ),
            ),
          ],
        ),
      );
    }

    //3 widgets three
    Container buildGridViewTop() => Container(
          width: size.width,
          padding: EdgeInsets.only(right: 10,top: 8,bottom: 8),
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  for (var i = 0; i < 2; i += 1)
                  Row(
                    children: [
                        Checkbox(
                          value: checked[i],
                          onChanged: (value) {
                            setState(() {
                              checked[i] = value;
                            });
                          },
                          activeColor: getColorFromHex('808080'),
                        ),
                      Text(
                        checkedText[i],
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              InkWell(
                onTap: (){print('hehehe');},
                child: Image.asset('assets/images/crossed-arrows.png',color:getColorFromHex('808080'),width: 20,height: 20,),
              )
            ],
          ),
        );
    Column buildGridView(Size size) => Column(
      children: [
        buildGridViewTop(),
        GridViewBottom(list: listKanji,),
      ],
    );
    return Container(
      width: size.width,
      child: SingleChildScrollView(
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                buildTop(size),
                Column(
                  children: [
                    buildPlashCard(
                        size,
                        'FLASHCARD',
                        'flash / card',
                        Icons.my_library_books,
                        'CHỌN',
                        'Kanji / Nghĩa',
                        FontAwesomeIcons.handPaper),
                    buildPlashCard(
                        size,
                        'FLASHCARD',
                        'flash / card',
                        FontAwesomeIcons.handPaper,
                        'CHỌN',
                        'Kanji / Nghĩa',
                        FontAwesomeIcons.handPaper),
                  ],
                ),

                buildGridView(size),
              ],
            ),
          ],
        ),
      ),
    );
  }



  void _showPicker(BuildContext ctx, int index) {
    showCupertinoModalPopup(
        context: ctx,
        builder: (_) => Wrap(
              children: [
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          Icon(
                            FontAwesomeIcons.angleDown,
                            color: getColorFromHex("CCCCCC"),
                          ),
                          Icon(FontAwesomeIcons.angleUp,
                              color: getColorFromHex("CCCCCC"))
                        ],
                      ),
                      FlatButton(
                        child: Text(
                          'Done',
                          style: TextStyle(
                              color: mainBackGroundHome, fontSize: 18),
                        ),
                        color: Colors.white,
                        focusColor: Colors.white,
                        highlightColor: Colors.white,
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  child: CupertinoPicker(
                    backgroundColor: getColorFromHex("CCCCCC"),
                    itemExtent: 40,

                    scrollController:
                        FixedExtentScrollController(initialItem: 1),
                    children: List.generate(dataSelect.length, (index) {
                      return Container(
                        child: Text(dataSelect[index]),
                      );
                    }),
                    onSelectedItemChanged: (value) {
                      setState(() {
                        _selectedValue = dataSelect[value];
                        switch (index) {
                          case 1:
                            {
                              _select1 = _selectedValue;
                            }
                            break;
                          case 2:
                            {
                              _select2 = _selectedValue;
                            }
                            break;
                          default:
                            {
                              _select3 = _selectedValue.toInt();
                            }
                            break;
                        }
                      });
                    },
                  ),
                ),
              ],
            ));
  }
}
