import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:page_transition/page_transition.dart';
import 'package:vietnhat/common_widgets/export_common_widgets.dart';
import 'package:vietnhat/shares/share.dart';
import 'export_page.dart';

import '03_login.dart';

class Tracuu extends StatefulWidget {
  @override
  _TracuuState createState() => _TracuuState();
}

class _TracuuState extends State<Tracuu> {
  int _indexActive = 0;
  String textSearch = 'Từ vựng';

  String _trinhdo = 'Tất cả';
  String _chucnang = 'Tất cả';

  List pushClass = [Tracuu(), Translate(),JLPTPage()];

  @override
  Widget build(BuildContext context) {
    final getWidth = MediaQuery.of(context).size.width;
    List arraySearch = [
      "Tất cả",
      'Đối chiếu',
      'Xếp hàng, liệt kê ',
      'Diễn tả',
      'Tình huống, trường hợp',
      'Phương tiện, phương pháp',
      'Biểu thị bằng ví dụ',
      'Nguyên nhân, lý do',
      'Cương vị, quan điểm',
      'Trạng thái',
      'Nhấn mạnh',
      'Khả năng',
      'Vô can',
      'Điều không ăn khớp với dự đoán',
      'Bất biến',
      'Suy đoán',
      'Hehe',
      'Nhấn mạnh về mức độ',
      'Kết luận',
      'Trạng thái kết quả',
      'Liên tục',
      'Được lợi',
      'Hạn định'
    ];
    List _listTrinhDo = ['Tất cả', 'N5', 'N4', 'N3', 'N2', 'N1'];

    Row homeNavSelect() {
      List tabMenu = ['単語 ,Từ vựng ', '漢字 ,Hán từ', '文 ,Câu', 'に, để'];
      List nav = ['Từ vựng', 'Hán từ', 'Câu', 'Ngữ pháp'];
      Expanded homeSingleNav(String text, int index) {
        return Expanded(
          flex: 4,
          child: Padding(
            padding: const EdgeInsets.all(2),
            child: InkWell(
              onTap: () {
                setState(() {
                  _indexActive = index;
                  textSearch = tabMenu[index];
                });
              },
              child: Container(
                padding:
                    EdgeInsets.only(right: 3, left: 3, top: 12, bottom: 12),
                decoration: BoxDecoration(
                  color: _indexActive == index
                      ? mainBackGroundHome
                      : getColorFromHex("F5F5F5"),
                ),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      text,
                      style: TextStyle(
                          color: _indexActive == index
                              ? Colors.white
                              : getColorFromHex("808080"),
                          fontSize: 16),
                    ),
                  ],
                ),
                // height: 45,
              ),
            ),
          ),
        );
      }

      return Row(
        children: List.generate(nav.length, (index) {
          return homeSingleNav(nav[index], index);
        }),
      );
    }

    Container homeSearch(textSearch) {
      return Container(
        width: getWidth,
        decoration: BoxDecoration(color: Colors.white),
        child: Row(
          children: [
            Container(
              height: 50,
              width: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 5,
                  ),
                  InkWell(
                      child: Icon(
                        FontAwesomeIcons.microphone,
                        color: mainBackGroundHome,
                        size: 18,
                      ),
                      onTap: () {}),
                  SizedBox(
                    width: 5,
                  ),
                  InkWell(
                      child: Icon(FontAwesomeIcons.camera,
                          color: mainBackGroundHome, size: 18),
                      onTap: () {}),
                  SizedBox(
                    width: 5,
                  ),
                  InkWell(
                      child: Icon(
                        FontAwesomeIcons.edit,
                        color: mainBackGroundHome,
                        size: 18,
                      ),
                      onTap: () {}),
                  SizedBox(
                    width: 5,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  padding: EdgeInsets.only(left: 10),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: textSearch,
                      hintStyle: TextStyle(
                          fontSize: 18, color: Colors.black.withOpacity(0.5)),
                      enabledBorder: InputBorder.none,
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      // contentPadding: EdgeInsets.only(top: 3),
                    ),
                  )),
            ),
            Container(
              child: IconButton(
                  icon: Icon(
                    Icons.search,
                    color: mainBackGroundHome,
                    size: 22,
                  ),
                  onPressed: () {}),
            )
          ],
        ),
      );
    }

    Widget homeGrammar() {
      //select chuc nang
      Expanded selectChucNang(List array, bool left, String chucnang) {
        return Expanded(
            flex: 2,
            child: left == false
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: List.generate(array.length, (index) {
                      if (index % 2 != 0) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              _chucnang = arraySearch[index];
                            });
                            Navigator.pop(context);
                          },
                          child: Container(
                            height: 40,
                            child: Text(
                              array[index],
                              style: TextStyle(
                                  fontSize: 16,
                                  color: chucnang == array[index]
                                      ? mainBackGroundHome
                                      : Colors.black.withOpacity(0.7)),
                            ),
                            padding: EdgeInsets.only(top: 10, bottom: 10),
                          ),
                        );
                      }
                      ;
                      return SizedBox(
                        height: 0,
                        width: 0,
                      );
                    }))
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: List.generate(array.length, (index) {
                      if (index == 0 || index % 2 == 0) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              _chucnang = arraySearch[index];
                            });
                            Navigator.pop(context);
                          },
                          child: Container(
                            height: 40,
                            child: Text(
                              array[index],
                              style: TextStyle(
                                  fontSize: 16,
                                  color: chucnang == array[index]
                                      ? mainBackGroundHome
                                      : Colors.black.withOpacity(0.7)),
                            ),
                            padding: EdgeInsets.only(top: 10, bottom: 10),
                          ),
                        );
                      }
                      ;
                      return SizedBox(
                        height: 0,
                        width: 0,
                      );
                    })));
      }

      //button
      InkWell grammarDropdown(
          String title, String trinhdo, String chucnang, double width) {
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              PageTransition(
                  curve: Curves.linear,
                  type: PageTransitionType.bottomToTop,
                  child: Scaffold(
                    backgroundColor: Colors.white,
                    appBar: AppBar(
                      backgroundColor: Colors.white,
                      automaticallyImplyLeading: false,
                      elevation: 0,
                      title: Text(
                        'Chọn trình độ và chức năng ',
                        style: TextStyle(
                            fontSize: 18, color: Colors.black.withOpacity(0.7)),
                      ),
                      actions: [
                        IconButton(
                            icon: Icon(Icons.close),
                            color: Colors.black.withOpacity(0.7),
                            onPressed: () => Navigator.pop(context))
                      ],
                      bottom: PreferredSize(
                          preferredSize: Size.fromHeight(60),
                          child: Column(
                            children: [
                              Container(
                                height: 50,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8.0, right: 8),
                                  child: TextField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: 'Tìm kiếm chức năng',
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Divider(
                                height: 1,
                                color: divider,
                                thickness: 1.5,
                              )
                            ],
                          )),
                    ),
                    body: Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).padding.top),
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Trình độ:',
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: Colors.black,
                                    fontSize: 18),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width - 100,
                                padding: EdgeInsets.all(16),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: List.generate(6, (index) {
                                    return InkWell(
                                      onTap: () {
                                        setState(() {
                                          _trinhdo = _listTrinhDo[index];
                                        });
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        _listTrinhDo[index],
                                        style: TextStyle(
                                            color: trinhdo ==
                                                    _listTrinhDo[index]
                                                ? mainBackGroundHome
                                                : Colors.black.withOpacity(0.7),
                                            fontSize: 16),
                                      ),
                                    );
                                  }),
                                ),
                              ),
                              Text(
                                'Chức năng:',
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: Colors.black,
                                    fontSize: 18),
                              ),
                              Container(
                                  width: getWidth,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      selectChucNang(
                                          arraySearch, true, _chucnang),
                                      selectChucNang(
                                          arraySearch, false, _chucnang)
                                    ],
                                  )),
                              SizedBox(
                                height: 50,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )),
            );
          },
          child: Container(
            height: 40,
            width: width,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('${title} :'),
                //item select
                DropdownMenuSelect(
                  value: title == 'Trình độ' ? _trinhdo : _chucnang,
                ),
                Icon(Icons.arrow_drop_down),
              ],
            ),
          ),
        );
      }

      Padding grammarCard(String _trinhdo) {
        return Padding(
          padding: const EdgeInsets.only(left: 5, right: 5, bottom: 10),
          child: Container(
            height: 140,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(color: Colors.white),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeaderWidgets(
                    color: Colors.black, text: '~  に', paddingTopBottom: 15),
                Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      'Vào, vào lúc => ${_chucnang != 'Tất cả' ? _chucnang : ''}',
                      style: TextStyle(color: Colors.black54, fontSize: 16),
                    )),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, top: 10),
                  child: Row(
                    children: [
                      FlatButton(
                        onPressed: () {},
                        height: 30,
                        minWidth: 50,
                        child: Text(
                          _trinhdo != 'Tất cả' ? _trinhdo : 'N5',
                          style: TextStyle(color: Colors.white),
                        ),
                        color: _trinhdo == 'N5' || _trinhdo == 'Tất cả'
                            ? Colors.red
                            : _trinhdo == 'N4'
                                ? Colors.yellow[600]
                                : _trinhdo == 'N3'
                                    ? Colors.blue
                                    : _trinhdo == 'N2'
                                        ? Colors.green
                                        : Colors.black.withOpacity(0.6),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(_chucnang != 'Tất cả' ? _chucnang : '')
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      }

      return Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 5),
            height: 60,
            child: Row(
              children: [
                grammarDropdown('Trình độ', _trinhdo, _chucnang, 140),
                SizedBox(
                  width: 5,
                ),
                grammarDropdown('Chức năng', _trinhdo, _chucnang, 200),
              ],
            ),
          ),
          Container(
            width: getWidth,
            child: Column(
              children: List.generate(10, (index) {
                return grammarCard(_trinhdo);
              }),
            ),
          ),
        ],
      );
    }

    Widget homeSelect(String textSearch, int index) {
      //search

      //imgae qc
      Container homeImageQc() => Container(
            width: double.infinity,
            height: 150,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/image_qc.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ); //imgae

      //tien ich
      Container homeTienIch() {
        List gridView = [
          {'icon': Icons.translate, "text": "Dịch",},
          {'icon': Icons.language, "text": "Cộng động"},
          {'icon': Icons.book, "text": "Từ của tôi"},
          {'icon': Icons.content_copy, "text": "JLPT"},
          {'icon': Icons.live_tv, "text": "Đọc báo"},
          {'icon': Icons.live_tv, "text": "Đề thi"},
          {'icon': Icons.live_tv, "text": "Tập viết"},
          {'icon': Icons.more_horiz, "text": "Xem thêm"},
        ];

        return Container(
          width: double.infinity,
          decoration: BoxDecoration(color: Colors.white),
          child: Column(
            children: [
              HeaderWidgets(
                  color: Colors.black,
                  text: 'Tiện ích',
                  paddingTopBottom: 15),
              Container(
                width: MediaQuery.of(context).size.width,
                height: getWidth < 450
                    ? 210
                    : MediaQuery.of(context).size.height * 0.8,
                decoration: BoxDecoration(color: Colors.white),
                child: GridView.count(
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 4,
                  children: List.generate(gridView.length, (index) {
                    return IconGridView(
                      iconData: gridView[index]['icon'],
                      text: gridView[index]['text'],
                      onPressed: () {
                        Navigator.push(context, PageTransition(child: HomePage(idUtility: index,utility: true,), type: PageTransitionType.leftToRight));
                      },
                    );
                  }),
                ),
              )
            ],
          ),
        );
      }

      //login
      Container homeLogin() => Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              children: [
                HeaderWidgets(
                    color: Colors.black,
                    text: 'Bạn chưa đăng nhập',
                    paddingTopBottom: 15),
                Container(
                  padding: EdgeInsets.only(left: 15, right: 4, bottom: 8),
                  child: Text(
                    'Đăng nhập để khám phá thêm nhiều tính năng hữu ích của IZI',
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.7),
                      fontSize: 16,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FlatButton(
                        color: mainBackGroundHome,
                        onPressed: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                child: LoginPage(),
                                curve: Curves.linear,
                                type: PageTransitionType.rightToLeftWithFade,
                              ));
                        },
                        child: Text(
                          'Đăng nhập',
                          style: TextStyle(color: Colors.white),
                        )),
                    SizedBox(
                      width: 20,
                    )
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
              ],
            ),
          );

      //answer
      Container buildAnswer() {
        return Container(
          padding: EdgeInsets.only(left: 10, right: 10),
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            children: [
              HeaderWidgets(
                  color: Colors.black,
                  text: 'Hỏi và đáp',
                  paddingTopBottom: 15),
              Container(
                child: Column(
                  children: List.generate(3, (index) {
                    return Column(
                      children: [
                        AnswerHome(
                            text: 'Hôm nay ăn gì đây', users: 'huyentringuyen')
                      ],
                    );
                  }),
                ),
              ),
              FooterMoreWigets(color: mainBackGroundHome, paddingBottom: 8),
            ],
          ),
        );
      }

      //vocabulary
      Container homeVocabulary() {
        //vocabulary
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            children: [
              HeaderWidgets(
                  color: Colors.black,
                  text: 'Từ vụng mỗi ngày',
                  paddingTopBottom: 15),
              Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  children: List.generate(3, (index) {
                    return Vocabulary(
                      index: index,
                      lenght: 3,
                      textJapan: '肺炎、肺炎',
                      textVN: 'Có con chim vành khuyên nhỏ',
                      onPressed: () {
                        print('lam gi do');
                      },
                    );
                  }),
                ),
              ),
            ],
          ),
        );
      }

      //reading
      Container buildReading() {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            children: [
              HeaderWidgets(
                  color: Colors.black,
                  text: 'Luyện đọc',
                  paddingTopBottom: 15),
              Column(
                children: List.generate(3, (index) {
                  return ReadingApp(
                      image: "assets/images/anhdep.jpeg",
                      header: "毎日読書の練習",
                      sizeHeader: 18,
                      text: "毎日読書の練習 毎日読書の練習 毎日読書の練習 毎日読書の練習",
                      sizeText: 15,
                      colorHeader: Colors.black.withOpacity(0.8),
                      colorText: Colors.black.withOpacity(0.6),
                      time: '2021-03-11 12:00:00');
                }),
              ),
              FooterMoreWigets(color: mainBackGroundHome, paddingBottom: 8),
            ],
          ),
        );
      }

      // every day
      Container buildEveryDay() {
        return Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            children: [
              HeaderWidgets(
                  color: Colors.black,
                  text: 'Mỗi ngày một bài hát',
                  paddingTopBottom: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 150,
                    height: 80,
                    child: Image(
                      image: AssetImage("assets/images/anhdep.jpeg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '幻想幻想',
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(height: 25,),
                        Padding(
                          padding: const EdgeInsets.only(right:10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '05:57',
                                style: TextStyle(fontSize: 18),
                              ),
                              FlatButton(
                                onPressed: () {},
                                child: Text(
                                  'Dễ',
                                  style: TextStyle(color: Colors.white),
                                ),
                                color: Colors.green[600],
                                height: 25,
                                minWidth: 20,
                              ),
                            ],
                          ),
                        ),

                      ],
                    ),
                  )),

                ],
              ),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        );
      }

      //more ap
      Container buildAppMore() {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            children: [
              HeaderWidgets(
                  color: Colors.black,
                  text: 'Ứng dụng khác',
                  paddingTopBottom: 15),
              Column(
                children: List.generate(3, (index) {
                  return ReadingApp(
                    image: "assets/images/anhdep.jpeg",
                    header: "Japanese Voice: Listen & Speaking",
                    sizeHeader: 18,
                    text:
                        "Luyện nghe và nói với người bản ngữ. Sở hữu ngay +3.000 video đầy đủ phụ đề và lời dịch",
                    sizeText: 15,
                    colorHeader: Colors.black.withOpacity(0.8),
                    colorText: Colors.black.withOpacity(0.6),
                  );
                }),
              ),
              FooterMoreWigets(color: mainBackGroundHome, paddingBottom: 8),
            ],
          ),
        );
      }

      return Column(
        children: [
          SizedBox(
            height: 8,
          ),
          homeImageQc(),
          SizedBox(
            height: 8,
          ),
          homeTienIch(),
          SizedBox(
            height: 8,
          ),
          homeLogin(),
          SizedBox(
            height: 8,
          ),
          buildAnswer(),
          SizedBox(
            height: 8,
          ),
          homeVocabulary(),
          SizedBox(
            height: 8,
          ),
          buildReading(),
          SizedBox(
            height: 8,
          ),
          buildEveryDay(),
          SizedBox(
            height: 8,
          ),
          buildAppMore(),
        ],
      );
    }

    return SingleChildScrollView(
      child: Column(
        children: [
          homeNavSelect(),
          homeSearch(textSearch),
          _indexActive == 3
              ? homeGrammar()
              : homeSelect(textSearch, _indexActive),
          SizedBox(
            height: 100,
          ),
        ],
      ),
    );
  }
}
