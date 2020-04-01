import 'package:covid19/ui/shared/app_colors.dart';
import 'package:covid19/ui/shared/ui_helpers.dart';
import 'package:flutter/material.dart';

class TileWidget extends StatelessWidget {

  final String title;
  final int number;
  final Color color;
  final Color circleColor;

  TileWidget({this.title, this.number, this.color, this.circleColor});
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: <Widget>[
          Image.asset("assets/images/circle.png", scale: 1.1, color: circleColor,),
          UIHelper.verticalSpaceMedium(),
          Center(
            child: Text(
              number.toString(),
              style: TextStyle(
                color: color,
                fontFamily: "AeonikRegular",
                fontSize: 45.0
              ),
            )
          ),
          UIHelper.verticalSpaceMedium(),
          Center(
            child: Text(
              title,
              style: TextStyle(
                color: Colors.grey,
                fontFamily: "AeonikRegular",
                fontSize: 12.0
              ),
            ),
          ),
        ],
      ),
    );
  }
}