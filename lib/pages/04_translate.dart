import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:vietnhat/data/data.dart';
import 'package:vietnhat/shares/share.dart';

class Translate extends StatefulWidget {
  @override
  _TranslateState createState() => _TranslateState();
}

class _TranslateState extends State<Translate> {
  bool _convert = true;
  bool _select = true;
  String _inputValue = 'Nhập văn bản';
  String language1 = language[0];
  String language2 = language[language.length - 1];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final widthScreen = size.width;
    final heightScreen = size.height;

    Container translate_selectLanguage(double widthScreen, bool select) {
      return Container(
        width: widthScreen,
        color: Colors.white,
        child: Column(
          children: List.generate(language.length, (index) {
            return InkWell(
              onTap: () {
                if (select) {
                  changeLanguage(language[index], null);
                } else {
                  changeLanguage(null, language[index]);
                }
                selectDestination(!_convert);
              },
              child: Container(
                padding: EdgeInsets.only(
                    top: index == 0 ? 20 : 10,
                    bottom: index == language.length - 1 ? 20 : 10),
                child: Text(
                  language[index],
                  style: TextStyle(
                    fontSize: 16,
                    color: select == true
                        ? language1 == language[index]
                            ? Colors.black
                            : getColorFromHex("7C7C7C")
                        : language2 == language[index]
                            ? Colors.black
                            : getColorFromHex("7C7C7C"),
                  ),
                ),
              ),
            );
          }),
        ),
      );
    }

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: getColorFromHex("DDDDDD"),
        body: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //container 2
            _convert
                ? Container(
                    height: 50,
                    color: Colors.white,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              selectDestination(!_convert);
                              selectLanguage(true);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  language1,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                                Icon(Icons.arrow_drop_down)
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: 40,
                          child: InkWell(
                            onTap: () => changeLanguage(language1, language2),
                            child: IconButton(
                              icon: Icon(
                                FontAwesomeIcons
                                    .exchangeAlt,color: Colors.black,
                              ),
                              iconSize: 18,
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              selectDestination(!_convert);
                              selectLanguage(false);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  language2,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                                Icon(Icons.arrow_drop_down)
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : translate_selectLanguage(widthScreen, _select),
            //container1
            _convert
                ? Container(
                    height: 200,
                    color: Colors.white,
                    child: InkWell(
                      onTap: () => selectDestination(true),
                      child: Column(
                        children: [
                          Divider(
                              height: 1.5,
                              thickness: 1,
                              color: getColorFromHex("CCCCCC")),
                          Container(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            height: 120,
                            child: SingleChildScrollView(
                              physics: _inputValue == 'Nhập văn bản' ||
                                      _inputValue == ''
                                  ? NeverScrollableScrollPhysics()
                                  : AlwaysScrollableScrollPhysics(),
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Nhập văn bản',
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                                onChanged: (value) => setValue(value),
                                maxLines: 8,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20,right: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                        icon: Icon(Icons.camera_alt_rounded,color: getColorFromHex('27509D'),size:25),
                                        onPressed: () {}),
                                    Text('Máy ảnh'),
                                  ],
                                ),
                                Column(
                                  children: [
                                    IconButton(
                                        icon: Icon(Icons.edit,color: getColorFromHex('27509D'),size:25 ,),
                                        onPressed: () {}),
                                    Text('Máy ảnh'),
                                  ],
                                ),
                                Column(
                                  children: [
                                    IconButton(
                                        icon: Icon(Icons.mic,color: getColorFromHex('27509D'),size:25),
                                        onPressed: () {}),
                                    Text('Máy ảnh'),
                                  ],
                                ),
                                FlatButton(
                                    onPressed: () {},
                                    child: Text(
                                      'Dịch',
                                      style: TextStyle(color: white),
                                    ),
                                color: getColorFromHex('27509D'),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                : SizedBox(
                    height: 0,
                  ),
          ],
        )),
      ),
    );
  }

  void selectDestination(bool index) {
    setState(() {
      _convert = index;
      print(_convert);
    });
  }

  void selectLanguage(bool index) {
    setState(() {
      _select = index;
      print(_select);
    });
  }

  void changeLanguage(String lg1, String lg2) {
    if (lg1 != null && lg2 != null) {
      String temp = '';
      temp = lg1;
      lg1 = lg2;
      lg2 = temp;
      setState(() {
        language1 = lg1;
        language2 = lg2;
      });
    } else if (lg1 != null) {
      setState(() {
        language1 = lg1;
      });
    } else {
      setState(() {
        language2 = lg2;
      });
    }
  }

  void setValue(String value) {
    _inputValue = value;
  }
}
