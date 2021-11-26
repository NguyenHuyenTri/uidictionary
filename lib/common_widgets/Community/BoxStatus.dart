import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:page_transition/page_transition.dart';
import 'package:vietnhat/models/PageCommunity/Status.dart';
import 'package:vietnhat/pages/07_community.dart';
import 'package:vietnhat/pages/07_community_details.dart';
import 'package:vietnhat/shares/share.dart';

List<Status> listStatus = [
  Status(
      'ƠN GIỜI SALE ĐÂY RỒI !!!',
      'Nguyễn Huyền Trí',
      'assets/images/avartar.jpg',
      'Admin',
      '1 ngày',
      'Học tiếng Nhật',
      'IZI HOT SALE đến 30% trong 2 ngày 17/3 - 18/3. Khi nâng cấp các gói IZI Premium. '
          'Giảm 30% gói IZI Premium 1 năm giá còn 175.000đ. Nói chung là dùng cả đời, giá cực hời luôn '
          '!!>> Khám giá IZI Premium Thêm vài chữ cho nó hiện xem thêm IZI HOT SALE đến 30% trong 2 ngày 17/3 - 18/3. '
          'Khi nâng cấp các gói IZI Premium. Giảm 30% gói IZI Premium 1 năm giá còn 175.000đ.',
      10,
      10,
      1),
  Status(
      'ƠN GIỜI SALE ĐÂY RỒI !!!',
      'Ronaldo',
      'assets/images/avartar.jpg',
      'Chuyên gia',
      '1 ngày',
      'Học tiếng Nhật',
      'IZI HOT SALE đến 30% trong 2 ngày 17/3 - 18/3. Khi nâng cấp các gói IZI Premium. Giảm 30% gói IZI Premium 1 năm giá còn 175.000đ. Nói chung là dùng cả đời, giá cực hời luôn !!>> Khám giá IZI Premium',
      10,
      10,
      1),
  Status(
      'ƠN GIỜI SALE ĐÂY RỒI !!!',
      'Messi',
      'assets/images/avartar.jpg',
      'Thành viên',
      '1 ngày',
      'Học tiếng Nhật',
      'IZI HOT SALE đến 30% trong 2 ngày 17/3 - 18/3. Khi nâng cấp các gói IZI Premium. Giảm 30% gói IZI Premium 1 năm giá còn 175.000đ. Nói chung là dùng cả đời, giá cực hời luôn !!>> Khám giá IZI Premium',
      10,
      10,
      1),
];

class BoxCard extends StatelessWidget {
  const BoxCard({
    @required this.title,
    @required this.userName,
    @required this.image,
    @required this.userRoles,
    @required this.time,
    @required this.studyLanguage,
    @required this.status,
    @required this.totalFavourite,
    @required this.totalComment,
    @required this.details,
    @required this.id,
  });

  final String title;
  final String userName;
  final String userRoles;
  final String time;
  final String image;
  final String studyLanguage;
  final String status;
  final int totalFavourite;
  final int totalComment;
  final int details;
  final int id;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        if (id >= 0) {
          Navigator.push(
              context,
              PageTransition(
                  child: CommunityDetails(
                    id: id,
                  ),
                  type: PageTransitionType.fade));
        }
      },
      child: Card(
        elevation: 4,
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            Container(
              width: size.width,
              padding: EdgeInsets.only(left: 10, right: 10, top: 10),
              child: Text(title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(image),
              ),
              title: Text(
                userName,
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              subtitle: Row(
                children: [
                  Text(
                    userRoles,
                    style: TextStyle(color: Colors.black.withOpacity(0.6)),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    time,
                    style: TextStyle(color: Colors.black.withOpacity(0.6)),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                      color: getColorFromHex('F3F3F3'),
                      padding: EdgeInsets.all(3),
                      child: Text(
                        studyLanguage,
                        style: TextStyle(color: Colors.black.withOpacity(0.6)),
                      ))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16, left: 16, bottom: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    status.length < 220 || id < 0
                        ? status
                        : status.substring(0, 220) + '',
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.6), fontSize: 16),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  status.length > 220 && id >= 0
                      ? InkWell(
                          child: Text(
                            'Xem thêm',
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: getColorFromHex('4285F4'),
                                fontSize: 16),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                    child: CommunityDetails(
                                      id: id,
                                    ),
                                    type: PageTransitionType.fade));
                          },
                        )
                      : SizedBox(
                          height: 0,
                        ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            Container(
              height: 40,
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(color: Theme.of(context).dividerColor))),
              child: ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                children: [
                  FlatButton(
                    textColor: brownAnnswer,
                    onPressed: () {
                      // Perform some action
                    },
                    child: Row(
                      children: [
                        Text(
                          totalFavourite.toString(),
                          style: TextStyle(fontSize: 18, color: brownAnnswer),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(Icons.favorite_outlined,
                            size: 18, color: brownAnnswer.withOpacity(0.7))
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
                          totalComment.toString(),
                          style: TextStyle(fontSize: 18, color: brownAnnswer),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(Icons.chat_bubble_sharp,
                            size: 18, color: brownAnnswer.withOpacity(0.7))
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
                          details.toString(),
                          style: TextStyle(fontSize: 18, color: brownAnnswer),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(Icons.wifi,
                            size: 18, color: brownAnnswer.withOpacity(0.7))
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
    );
  }
}
