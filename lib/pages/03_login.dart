import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:vietnhat/shares/share.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Color faceColor = getColorFromHex('2E69Ce');
  @override
  Widget build(BuildContext context) {



    Padding buildBtnWithLogin(IconData icon ,double size , Color color ,String text) {
      return Padding(
        padding: const EdgeInsets.only(right :20.0 ,left:20 ,bottom: 8),
        child: InkWell(
          onTap: (){},
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border:Border.all(width: 1,color: color),
            ),
            child: TextButton.icon(
              autofocus: false,
              icon: FaIcon(icon ,size: size,color: color,),
              label: Text(text ,style: TextStyle(fontSize: size,color: color),),
            ),
          ),
        ),
      );
    }

    Padding buildTextInput(String text) {
      return Padding(
        padding: const EdgeInsets.only(left: 20,right: 20,bottom: 10),
        child: TextField(
          decoration: InputDecoration(
            hintText: text,
            hintStyle: TextStyle(
              color: getColorFromHex('8F8F8F'),
            ),
          ),
          obscureText: true,
          autocorrect: false,
          textInputAction: TextInputAction.done,
        ),
      );
    }



    return Scaffold(
        appBar: AppBar(
          backgroundColor: mainBackGroundHome,
          title: Text("Đăng nhập",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
          actions: [
            IconButton(icon: Icon(Icons.settings), onPressed: (){}),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
           child: Column(
             children: [
               Container(
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.stretch,
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     buildContainerHeader("ĐĂNG NHẬP NHANH VỚI",getColorFromHex('6B6B6B'),17),
                     buildBtnWithLogin(FontAwesomeIcons.facebookF ,15,faceColor,'Sign in with Facebook'),
                     buildBtnWithLogin(FontAwesomeIcons.google ,15,Colors.red,'Sign in with Google'),
                     buildBtnWithLogin(FontAwesomeIcons.apple ,15,getColorFromHex('000000'),'Sign in with Apple'),
                     SizedBox(height: 5,),
                     buildContainerHeader("HOẶC ĐĂNG NHẬP BẰNG VỚI EMAIL",getColorFromHex('6B6B6B'),17),
                     buildTextInput('Email'),
                     buildTextInput('Password'),
                     Padding(
                       padding: const EdgeInsets.only(left: 20 ,right: 20 ,top:10),
                       child: FlatButton(
                         color: getColorFromHex('A5C2F3'),
                           onPressed: (){},
                           height: 50,
                           child: Text('Đăng nhập',style: TextStyle(color: Colors.white,fontSize: 16),)),
                     ),
                     Padding(
                       padding: const EdgeInsets.only(left: 20 ,right: 20 ,top:10),
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           InkWell(child: Text('Quên mật khẩu',style: TextStyle(color: getColorFromHex('0101D7')),) ,onTap: (){},),
                           InkWell(child: Text('Đăng ký tài khoản mới',style: TextStyle(color: getColorFromHex('AE2424'))),onTap: (){}),
                         ],
                       ),
                     )
                   ],
                 ),
               )
             ],
           ),
          ),
        ),
    );
  }



  Container buildContainerHeader(String text , Color color ,double size) {
    return Container(
      padding: EdgeInsets.only(bottom: 15, top: 15),
      child: Row(
        children: [
          SizedBox(
            width: 20,
          ),
          Text(
            text,
            style: TextStyle(fontSize: size, color: color),
          ),
        ],
      ),
    );
  }
}
