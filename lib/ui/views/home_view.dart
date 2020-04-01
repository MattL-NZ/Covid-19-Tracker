import 'package:covid19/ui/shared/ui_helpers.dart';
import 'package:covid19/ui/widgets/app_header.dart';
import 'package:covid19/ui/widgets/subtitle.dart';
import 'package:covid19/ui/widgets/tile.dart';
import 'package:flutter/material.dart';
import 'package:covid19/core/constants/enums.dart';
import 'package:covid19/core/viewmodels/home_model.dart';
import 'package:covid19/ui/shared/app_colors.dart' as prefix0;
import 'package:covid19/ui/views/base_view.dart';
import 'package:photo_view/photo_view.dart';
import 'package:flutter/services.dart';

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: PhotoView(
          imageProvider: const NetworkImage("https://www.health.govt.nz/sites/default/files/images/our-work/diseases-conditions/covid19/hp7357_-_covid_confirmed_and_probable_cases_by_dhb-merged-010420.jpg"),
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}


class HomeView extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) { 
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return BaseView<HomeViewModel>(
      onModelReady: (model) => model.getLatestData(),
      builder: (context, model, child) => Scaffold(
        key: _scaffoldKey,
        body: model.state == ViewState.Busy
        ? CircularProgressIndicator()
        : SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              AppHeader(),
              UIHelper.verticalSpaceSmall(),
              SubTitle(
                titleText: 'Latest Updates',
                suibTitleText: 'Cases found today',
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TileWidget(
                    title: "Cases Today",
                    number: model.covidModel.todayCases,
                    color: prefix0.refreshData,
                    circleColor: prefix0.refreshData,
                  ),
                ],
              ),
              UIHelper.verticalSpaceSmall(),
              SubTitle(
                titleText: 'Total Numbers',
                suibTitleText: 'Last updated 1st April 2020',
                showRefreshButton: true,
                onTap: () async {
                  await model.getLatestData();
                  _scaffoldKey.currentState.showSnackBar(
                    SnackBar(
                      content: Text('Data updated successfully'),
                      duration: Duration(seconds: 3),
                    )
                  );
                },
              ),
              UIHelper.verticalSpaceSmall(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TileWidget(
                    title: "Infected",
                    number: model.covidModel.cases,
                    color: Color(0xFFFF8748),
                    circleColor: Color(0xFFFF8748),
                  ),
                  TileWidget(
                    title: "Deaths",
                    number: model.covidModel.deaths,
                    color: Color(0xFFFF4848),
                    circleColor: Color(0xFFFF4848),
                  ),
                  TileWidget(
                    title: "Recovered",
                    number: model.covidModel.recovered,
                    color: Color(0xFF36C12C),
                    circleColor: Color(0xFF36C12C),
                  ),
                ],
              ),
              SubTitle(
                titleText: 'Case Map',
                suibTitleText: 'Click on the map to open/close',
              ),
              GestureDetector(
                child: Center(
                  child: Hero(
                    tag: 'imageHero',
                    child: Image.network("https://www.health.govt.nz/sites/default/files/images/our-work/diseases-conditions/covid19/hp7357_-_covid_confirmed_and_probable_cases_by_dhb-merged-010420.jpg")
                  ),
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen();
                  }));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
