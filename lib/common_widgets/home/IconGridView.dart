import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class IconGridView extends StatelessWidget {
  const IconGridView({
    @required this.iconData,
    @required this.text,
    @required this.onPressed,
  });
  final IconData iconData;
  final String text;
  final VoidCallback onPressed;

  @override
  Center build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: onPressed,
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 50,
                width: 50,
                child: Icon(
                  iconData,
                  size: 25.0,
                  color: Colors.black.withOpacity(0.5),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border:
                      Border.all(width: 2, color: getColorFromHex('EEEEEE')),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(text,
                  style: TextStyle(color: Colors.black.withOpacity(0.5))),
            ]),
      ),
    );
  }
}

class GridText extends StatelessWidget {
  const GridText(@required this.array, @required this.left,@required this.onTap);
  final List array;
  final bool left;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {


    return Expanded(
      flex: 2,
      child: left==false ? Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: List.generate(array.length, (index) {
            if (index % 2 != 0) {
              return InkWell(
                onTap: onTap,
                child: Container(
                  height: 40,
                  child: Text(array[index],style: TextStyle(fontSize: 16),),
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                ),
              );
            }
            ;
            return SizedBox(
              height: 0,
              width: 0,
            );
          })):Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: List.generate(array.length, (index) {
            if (index ==0 || index % 2 == 0) {
              return InkWell(
                onTap: onTap,
                child: Container(
                  height: 40,
                  child: Text(array[index],style: TextStyle(fontSize: 16),),
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
    );
  }
}
