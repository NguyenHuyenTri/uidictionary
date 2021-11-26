import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:page_transition/page_transition.dart';
import 'package:vietnhat/data/data.dart';
import 'package:vietnhat/pages/03_login.dart';
import 'package:vietnhat/shares/share.dart';

import '04_translate.dart';
import '05_search.dart';
import '06_jlpt.dart';

import '07_community.dart';

class HomePage extends StatefulWidget {
  const HomePage({@required this.idUtility,@required this.utility=false});
  final int idUtility;
  final bool utility ;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  int _selectedDestination = 0;
  String _textMenu ;
  bool _utility ;

  List pushClass = [Tracuu(), Translate(),JLPTPage()];

  List pushUtility = [Translate(),Community(),Tracuu(),JLPTPage(),Tracuu(),Tracuu(),Tracuu(),Tracuu()];

  List _classSuper = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.utility){
      setState(() {
        _utility=widget.utility;
        _selectedDestination = widget.idUtility;
        _classSuper = pushUtility;
        _textMenu = menuUtility[_selectedDestination];
      });
    }else{
      _classSuper = pushClass;
      _textMenu=sizeBar1[_selectedDestination]['text'];
      _utility=false;
    }
    print(_textMenu);
  }

  @override
  Widget build(BuildContext context) {
    //appbar
    AppBar buildAppBar(_drawerKey, String textMenu) {
      return AppBar(
        backgroundColor: mainBackGroundHome,
        title: Text(textMenu),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            _drawerKey.currentState.openDrawer();
          },
          icon: Icon(Icons.menu),
        ),
        actions: [
          InkWell(
            child: Image.asset(
              "assets/logo/vietnam.png",
              width: 25,
            ),
            onTap: () {},
          ),
          SizedBox(
            width: 10,
          ),
          IconButton(
              icon: FaIcon(
                FontAwesomeIcons.clock,
                size: 16,
              ),
              onPressed: () {}),
          IconButton(
              icon: FaIcon(
                FontAwesomeIcons.cog,
                size: 16,
              ),
              onPressed: () {}),
        ],
      );
    }

    Drawer buildDrawer(BuildContext context ,bool utility) {
      ListTile buildListTile(IconData icon, String text,int index ,bool utility ) {
        return ListTile(
          leading: Icon(
            icon,
            color: _selectedDestination == index && !utility
                ? mainBackGroundHome
                : getColorFromHex("4C4C4C"),
          ),
          title: Text(
            text,
            style: TextStyle(
                color: _selectedDestination == index && !utility
                    ? mainBackGroundHome
                    : getColorFromHex("4C4C4C")),
          ),
          onTap: ()  async{
            setState(() {
              _utility = false;
              _classSuper=pushClass;
              _textMenu=sizeBar1[index]['text'];
              _selectedDestination =index;
            });
            Navigator.pop(context);
          },
        );
      }

      return Drawer(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: mainBackGroundHome,
            title: InkWell(
              child: Text(
                "IZI SOFT",
                style: TextStyle(color: getColorFromHex("F4F8FE"),
                fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () => Navigator.pop(context),
            ),
            elevation: 0,
            automaticallyImplyLeading: false,
            actions: [
              Padding(
                padding: const EdgeInsets.only(top: 6, bottom: 6, right: 10),
                child: FlatButton(
                  onPressed: () {
                    Navigator.push(context, PageTransition(child: LoginPage(), type: PageTransitionType.leftToRight));
                  },
                  child: Text(
                    "Đăng nhập",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  color: getColorFromHex("A5C2F3"),
                ),
              )
            ],
          ),
          body: ListView(
            padding: EdgeInsets.zero,
            children: [
              Column(
                children: List.generate(sizeBar1.length, (index) {
                  if(index==7){
                  return   Divider(
                      height: 1.5,
                      thickness: 1,
                      color: getColorFromHex("CCCCCC"),
                    );
                  }
                  return buildListTile(
                      sizeBar1[index]['icon'], sizeBar1[index]['text'], index,utility);
                }),
              ),
              Divider(
                height: 1.5,
                thickness: 1,
                color: getColorFromHex("CCCCCC"),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        icon: Icon(
                          Icons.share,
                          size: 20,
                        ),
                        onPressed: () {}),
                    IconButton(
                        icon: Icon(
                          Icons.star,
                          size: 20,
                        ),
                        onPressed: () {}),
                    IconButton(
                        icon: Icon(
                          Icons.book_outlined,
                          size: 20,
                        ),
                        onPressed: () {}),
                  ],
                ),
              ),
              Divider(
                height: 1.5,
                thickness: 1,
                color: getColorFromHex("CCCCCC"),
              ),
              SizedBox(
                height: 150,
              )
            ],
          ),
        ),
      );
    }
    return WillPopScope(
      onWillPop: () async => false,
      child:Scaffold(
        backgroundColor: getColorFromHex("DDDDDD"),
        key: _drawerKey,
        appBar: buildAppBar(_drawerKey, _textMenu),
        endDrawerEnableOpenDragGesture: false,
        drawer: buildDrawer(context,_utility),
        body: WillPopScope(
          onWillPop: () async => false,
          child: _selectedDestination<=_classSuper.length-1 ? _classSuper[_selectedDestination]:Tracuu() ,
        ),
      ),
    );

  }

  void selectDestination(int index) {
    setState(() {
      _selectedDestination = index;
    });
    print(_selectedDestination);
  }
}
