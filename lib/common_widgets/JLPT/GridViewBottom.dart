import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:page_transition/page_transition.dart';
import 'package:vietnhat/models/JLPT/HanTu.dart';
import 'package:vietnhat/models/JLPT/Kanji.dart';
import 'package:vietnhat/pages/06_jlpt_kanji.dart';

HanTu hantu = HanTu(
    '佑 - Hữu ', 'いち', 'いち', 1, 5, 'Một, là số đứng đàu các số đếm');
List<Kanji> listKanji = [
  Kanji(hantu, '佑', 'Hữu'),
  Kanji(hantu, '佑', 'Trí'),
  Kanji(hantu, '佑', 'Nè'),
  Kanji(hantu, '佑', 'Nè'),
  Kanji(hantu, '佑', 'Nè'),
  Kanji(hantu, '佑', 'Nè'),
  Kanji(hantu, '佑', 'Nè'),
  Kanji(hantu, '佑', 'Nè'),
  Kanji(hantu, '佑', 'Nè'),
  Kanji(hantu, '佑', 'Nè'),
];

class GridViewBottom extends StatelessWidget {
  GridViewBottom({@required this.list, @required this.checked});
  final List<Kanji> list;
  List<bool> checked = [true, true];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Container(
        padding: EdgeInsets.only(top: 10, bottom: 10),
        height: 400,
        width: size.width * 0.97,
        color: Colors.white,
        child: GridView.count(
          crossAxisCount: 5,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          // physics: NeverScrollableScrollPhysics(),
          // Generate 100 widgets that display their index in the List.
          children: List.generate(list.length, (index) {
            return buildCenterItem(index,context);
          }),
        ),
      ),
    );
  }

  InkWell buildCenterItem(int index ,context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            PageTransition(child: KanjiPage(), type: PageTransitionType.fade));
      },
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              list[index].tu,
              style: TextStyle(color: getColorFromHex('377EF5'), fontSize: 30),
            ),
            Text(
              list[index].nghia.toUpperCase(),
              style: TextStyle(color: getColorFromHex('707070'), fontSize: 12),
            )
          ],
        ),
      ),
    );
  }
}
