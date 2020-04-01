import 'package:covid19/core/viewmodels/home_model.dart';
import 'package:covid19/ui/shared/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SubTitle extends StatelessWidget {

  final String titleText;
  final String suibTitleText;
  final bool showRefreshButton;
  final Function onTap;
  SubTitle({this.titleText, this.suibTitleText, this.showRefreshButton = false, this.onTap});

  @override
  Widget build(BuildContext context) {
    var homeViewModel = Provider.of<HomeViewModel>(context);

    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: 25,
              child: Text(
                titleText,
                style: TextStyle(
                  fontFamily: 'GilroyBold',
                  fontSize: 18.0
                )
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  suibTitleText,
                  style: TextStyle(
                    fontFamily: 'GilroyRegular',
                    fontSize: 12.0
                  )
                ),
                showRefreshButton ? InkWell(
                  child: Text(
                    'Refresh Data',
                    style: TextStyle(
                      fontFamily: 'GilroyRegular',
                      fontSize: 12.0,
                      color: refreshData
                    ),
                  ),
                  onTap: onTap
                ) : Container(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}