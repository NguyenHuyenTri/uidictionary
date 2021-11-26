import 'package:flutter/material.dart';
import 'package:vietnhat/shares/share.dart';

class KanjiPage extends StatefulWidget {
  @override
  _KanjiPageState createState() => _KanjiPageState();
}

class _KanjiPageState extends State<KanjiPage> {

  final List<Widget> tabs = <Widget>[
    Tab(text: 'Từ vựng'),
    Tab(text: 'Hán từ'),
    Tab(text: 'Câu'),
    Tab(text: 'Ngữ pháp'),
  ];
  final int  indexPage =1 ;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex:indexPage ,
      length: tabs.length, // This is the number of tabs.
      child:Builder(builder: (BuildContext context) {
        final TabController tabController = DefaultTabController.of(context);
        tabController.addListener(() {
          if (!tabController.indexIsChanging) {
             print(tabController.index);
          }
        });
        return Scaffold(
          backgroundColor: backgroundHiden,
          body: SafeArea(
            child: Column(
              children: [
                Container(
                  constraints: BoxConstraints(maxHeight: 150.0,minHeight: 50),
                  child: Material(
                    color: mainBackGroundHome,
                    child: TabBar(
                      tabs: tabs,
                      labelStyle: TextStyle(
                        fontSize: 16
                      ),
                      indicatorWeight: 3,
                    ),
                  ),
                ),
                Expanded(
                  flex: tabs.length,
                  child: TabBarView(
                    children: tabs.map((Widget tab) {
                      return tab;
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

}

class ClassHanTu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerRight,
                child: IconButton(
                  icon: Icon(Icons.add,size: 30,color: brownAnnswer,),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

