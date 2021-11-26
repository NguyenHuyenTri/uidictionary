import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:vietnhat/common_widgets/Community/BoxStatus.dart';
import 'package:vietnhat/common_widgets/Test.dart';
import 'package:vietnhat/models/PageCommunity/Status.dart';
import 'package:vietnhat/shares/share.dart';

class CommunityDetails extends StatefulWidget {
  final int id;

  const CommunityDetails({@required this.id});

  @override
  _CommunityDetailsState createState() => _CommunityDetailsState();
}

class _CommunityDetailsState extends State<CommunityDetails> {
  Status _list;
  String dropdownValue = 'One';
  @override
  void initState() {
    // TODO: implement initState
    if (widget.id != null) {
      setState(() {
        _list = listStatus[widget.id];
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainBackGroundHome,
        title: Text(
          'Chi tiết câu hỏi',
          style: TextStyle(fontSize: 17),
        ),
        actions: [
          IconButton(
              icon: FaIcon(
                FontAwesomeIcons.cog,
                size: 16,
              ),
              onPressed: () {}),
        ],
      ),
      backgroundColor: backgroundHiden,
      body: SingleChildScrollView(
        child: Column(
          children: [
            BoxCard(
              title: _list.title,
              userName: _list.userName,
              image: _list.image,
              userRoles: _list.userRoles,
              time: _list.time,
              studyLanguage: _list.studyLanguage,
              status: _list.status,
              totalFavourite: _list.totalFavourite,
              totalComment: _list.totalComment,
              details: _list.details,
              id: -1,
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  height: 40,
                  width: size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '12 câu trả lời',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  )),
            ),
            Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/avartar.jpg'),
                    ),
                    title: Text(
                      'Trí',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    subtitle: Row(
                      children: [
                        Text(
                          'Admin',
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.6)),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          '3 giờ',
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.6)),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Text(
                      'Greyhound divisively hello coldly wonderfully marginally far upon excluding.',
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.6), fontSize: 18),
                    ),
                  ),
                  Container(
                    height: 40,
                    child: ButtonBar(
                      alignment: MainAxisAlignment.end,
                      children: [
                        FlatButton(
                          textColor: brownAnnswer,
                          onPressed: () {
                            // Perform some action
                          },
                          child: Row(
                            children: [
                              Text(
                                '1',
                                style: TextStyle(
                                    fontSize: 18, color: brownAnnswer),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(Icons.favorite_outlined,
                                  size: 18,
                                  color: brownAnnswer.withOpacity(0.7))
                            ],
                          ),
                        ),
                        FlatButton(
                          textColor: brownAnnswer,
                          onPressed: () {
                            // Perform some action
                          },
                          child: Row(
                            children: [
                              Text(
                                '2',
                                style: TextStyle(
                                    fontSize: 18, color: brownAnnswer),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(Icons.chat_bubble_sharp,
                                  size: 18,
                                  color: brownAnnswer.withOpacity(0.7))
                            ],
                          ),
                        ),
                        FlatButton(
                          textColor: brownAnnswer,
                          onPressed: () {
                            // Perform some action
                          },
                          child: Row(
                            children: [
                              Text(
                                '1',
                                style: TextStyle(
                                    fontSize: 18, color: brownAnnswer),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(Icons.wifi,
                                  size: 18,
                                  color: brownAnnswer.withOpacity(0.7))
                            ],
                          ),
                        ),
                        FlatButton(
                          textColor: brownAnnswer,
                          onPressed: () {
                            // Perform some action
                          },
                          child: Icon(Icons.warning,
                              size: 18, color: brownAnnswer.withOpacity(0.7)),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 24),
                    child: Container(
                      child: Column(
                        children: [
                          ListTile(
                            leading: CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/images/avartar.jpg'),
                            ),
                            title: Text(
                              'Trí',
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            subtitle: Row(
                              children: [
                                Text(
                                  'Admin',
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.6)),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  '3 giờ',
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.6)),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16, right: 16),
                            child: Text(
                              'Greyhound divisively hello coldly wonderfully marginally far upon excluding.',
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.6),
                                  fontSize: 18),
                            ),
                          ),
                          Container(
                            height: 40,
                            child: ButtonBar(
                              alignment: MainAxisAlignment.end,
                              children: [
                                FlatButton(
                                  textColor: brownAnnswer,
                                  onPressed: () {
                                    // Perform some action
                                  },
                                  child: Row(
                                    children: [
                                      Text(
                                        '1',
                                        style: TextStyle(
                                            fontSize: 18, color: brownAnnswer),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Icon(Icons.favorite_outlined,
                                          size: 18,
                                          color: brownAnnswer.withOpacity(0.7))
                                    ],
                                  ),
                                ),
                                FlatButton(
                                  textColor: brownAnnswer,
                                  onPressed: () {
                                    // Perform some action
                                  },
                                  child: Icon(Icons.warning,
                                      size: 18,
                                      color: brownAnnswer.withOpacity(0.7)),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 24),
                    child: Container(
                      child: Column(
                        children: [
                          ListTile(
                            leading: CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/images/avartar.jpg'),
                            ),
                            title: Text(
                              'Trí',
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            subtitle: Row(
                              children: [
                                Text(
                                  'Admin',
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.6)),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  '3 giờ',
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.6)),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16, right: 16),
                            child: Text(
                              'Greyhound divisively hello coldly wonderfully marginally far upon excluding.',
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.6),
                                  fontSize: 18),
                            ),
                          ),
                          Container(
                            height: 40,
                            child: ButtonBar(
                              alignment: MainAxisAlignment.end,
                              children: [
                                FlatButton(
                                  textColor: brownAnnswer,
                                  onPressed: () {
                                    // Perform some action
                                  },
                                  child: Row(
                                    children: [
                                      Text(
                                        '1',
                                        style: TextStyle(
                                            fontSize: 18, color: brownAnnswer),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Icon(Icons.favorite_outlined,
                                          size: 18,
                                          color: brownAnnswer.withOpacity(0.7))
                                    ],
                                  ),
                                ),
                                FlatButton(
                                  textColor: brownAnnswer,
                                  onPressed: () {
                                    // Perform some action
                                  },
                                  child: Icon(Icons.warning,
                                      size: 18,
                                      color: brownAnnswer.withOpacity(0.7)),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/avartar.jpg'),
                    ),
                    title: Text(
                      'Trí',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    subtitle: Row(
                      children: [
                        Text(
                          'Admin',
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.6)),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          '3 giờ',
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.6)),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Text(
                      'Greyhound divisively hello coldly wonderfully marginally far upon excluding.',
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.6), fontSize: 18),
                    ),
                  ),
                  Container(
                    height: 40,
                    child: ButtonBar(
                      alignment: MainAxisAlignment.end,
                      children: [
                        FlatButton(
                          textColor: brownAnnswer,
                          onPressed: () {
                            // Perform some action
                          },
                          child: Row(
                            children: [
                              Text(
                                '1',
                                style: TextStyle(
                                    fontSize: 18, color: brownAnnswer),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(Icons.favorite_outlined,
                                  size: 18,
                                  color: brownAnnswer.withOpacity(0.7))
                            ],
                          ),
                        ),
                        FlatButton(
                          textColor: brownAnnswer,
                          onPressed: () {
                            // Perform some action
                          },
                          child: Row(
                            children: [
                              Text(
                                '2',
                                style: TextStyle(
                                    fontSize: 18, color: brownAnnswer),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(Icons.chat_bubble_sharp,
                                  size: 18,
                                  color: brownAnnswer.withOpacity(0.7))
                            ],
                          ),
                        ),
                        FlatButton(
                          textColor: brownAnnswer,
                          onPressed: () {
                            // Perform some action
                          },
                          child: Row(
                            children: [
                              Text(
                                '1',
                                style: TextStyle(
                                    fontSize: 18, color: brownAnnswer),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(Icons.wifi,
                                  size: 18,
                                  color: brownAnnswer.withOpacity(0.7))
                            ],
                          ),
                        ),
                        FlatButton(
                          textColor: brownAnnswer,
                          onPressed: () {
                            // Perform some action
                          },
                          child: Icon(Icons.warning,
                              size: 18, color: brownAnnswer.withOpacity(0.7)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/avartar.jpg'),
                    ),
                    title: Text(
                      'Trí',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    subtitle: Row(
                      children: [
                        Text(
                          'Admin',
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.6)),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          '3 giờ',
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.6)),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Text(
                      'Greyhound divisively hello coldly wonderfully marginally far upon excluding.',
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.6), fontSize: 18),
                    ),
                  ),
                  Container(
                    height: 40,
                    child: ButtonBar(
                      alignment: MainAxisAlignment.end,
                      children: [
                        FlatButton(
                          textColor: brownAnnswer,
                          onPressed: () {
                            // Perform some action
                          },
                          child: Row(
                            children: [
                              Text(
                                '1',
                                style: TextStyle(
                                    fontSize: 18, color: brownAnnswer),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(Icons.favorite_outlined,
                                  size: 18,
                                  color: brownAnnswer.withOpacity(0.7))
                            ],
                          ),
                        ),
                        FlatButton(
                          textColor: brownAnnswer,
                          onPressed: () {
                            // Perform some action
                          },
                          child: Row(
                            children: [
                              Text(
                                '2',
                                style: TextStyle(
                                    fontSize: 18, color: brownAnnswer),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(Icons.chat_bubble_sharp,
                                  size: 18,
                                  color: brownAnnswer.withOpacity(0.7))
                            ],
                          ),
                        ),
                        FlatButton(
                          textColor: brownAnnswer,
                          onPressed: () {
                            // Perform some action
                          },
                          child: Row(
                            children: [
                              Text(
                                '1',
                                style: TextStyle(
                                    fontSize: 18, color: brownAnnswer),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(Icons.wifi,
                                  size: 18,
                                  color: brownAnnswer.withOpacity(0.7))
                            ],
                          ),
                        ),
                        FlatButton(
                          textColor: brownAnnswer,
                          onPressed: () {
                            // Perform some action
                          },
                          child: Icon(Icons.warning,
                              size: 18, color: brownAnnswer.withOpacity(0.7)),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 24),
                    child: Container(
                      child: Column(
                        children: [
                          ListTile(
                            leading: CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/images/avartar.jpg'),
                            ),
                            title: Text(
                              'Trí',
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            subtitle: Row(
                              children: [
                                Text(
                                  'Admin',
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.6)),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  '3 giờ',
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.6)),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16, right: 16),
                            child: Text(
                              'Greyhound divisively hello coldly wonderfully marginally far upon excluding.',
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.6),
                                  fontSize: 18),
                            ),
                          ),
                          Container(
                            height: 40,
                            child: ButtonBar(
                              alignment: MainAxisAlignment.end,
                              children: [
                                FlatButton(
                                  textColor: brownAnnswer,
                                  onPressed: () {
                                    // Perform some action
                                  },
                                  child: Row(
                                    children: [
                                      Text(
                                        '1',
                                        style: TextStyle(
                                            fontSize: 18, color: brownAnnswer),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Icon(Icons.favorite_outlined,
                                          size: 18,
                                          color: brownAnnswer.withOpacity(0.7))
                                    ],
                                  ),
                                ),
                                FlatButton(
                                  textColor: brownAnnswer,
                                  onPressed: () {
                                    // Perform some action
                                  },
                                  child: Icon(Icons.warning,
                                      size: 18,
                                      color: brownAnnswer.withOpacity(0.7)),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 24),
                    child: Container(
                      child: Column(
                        children: [
                          ListTile(
                            leading: CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/images/avartar.jpg'),
                            ),
                            title: Text(
                              'Trí',
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            subtitle: Row(
                              children: [
                                Text(
                                  'Admin',
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.6)),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  '3 giờ',
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.6)),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16, right: 16),
                            child: Text(
                              'Greyhound divisively hello coldly wonderfully marginally far upon excluding.',
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.6),
                                  fontSize: 18),
                            ),
                          ),
                          Container(
                            height: 40,
                            child: ButtonBar(
                              alignment: MainAxisAlignment.end,
                              children: [
                                FlatButton(
                                  textColor: brownAnnswer,
                                  onPressed: () {
                                    // Perform some action
                                  },
                                  child: Row(
                                    children: [
                                      Text(
                                        '1',
                                        style: TextStyle(
                                            fontSize: 18, color: brownAnnswer),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Icon(Icons.favorite_outlined,
                                          size: 18,
                                          color: brownAnnswer.withOpacity(0.7))
                                    ],
                                  ),
                                ),
                                FlatButton(
                                  textColor: brownAnnswer,
                                  onPressed: () {
                                    // Perform some action
                                  },
                                  child: Icon(Icons.warning,
                                      size: 18,
                                      color: brownAnnswer.withOpacity(0.7)),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
