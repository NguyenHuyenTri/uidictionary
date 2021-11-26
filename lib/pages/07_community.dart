import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:page_transition/page_transition.dart';
import 'package:vietnhat/common_widgets/Community/BoxStatus.dart';
import 'package:vietnhat/pages/03_login.dart';

import 'package:vietnhat/shares/share.dart';

class Community extends StatefulWidget {
  @override
  _CommunityState createState() => _CommunityState();
}

class _CommunityState extends State<Community> {


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundHiden,
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildTopLogin(context),
            SizedBox(height: 5,),
            Wrap(
              children: List.generate(listStatus.length, (index) {
                return BoxCard(
                    title: listStatus[index].title,
                    userName: listStatus[index].userName,
                    image: listStatus[index].image,
                    userRoles: listStatus[index].userRoles,
                    time: listStatus[index].time,
                    studyLanguage: listStatus[index].studyLanguage,
                    status: listStatus[index].status,
                    totalFavourite: listStatus[index].totalFavourite,
                    totalComment: listStatus[index].totalComment,
                    details: listStatus[index].details,
                    id: index,
                );
              }),
            )
          ],
        ),
      ),
    );
  }

  Container buildTopLogin(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Đăng nhập để trải nghiệm thêm nhiều tính năng',
            style: TextStyle(color: getColorFromHex('737373'), fontSize: 16),
          ),
          SizedBox(
            height: 5,
          ),
          InkWell(
            child: Text(
              'Đăng nhập',
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: getColorFromHex('4285F4'),
                  fontSize: 16),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  PageTransition(
                      child: LoginPage(),
                      type: PageTransitionType.leftToRight));
            },
          ),
        ],
      ),
    );
  }
}
