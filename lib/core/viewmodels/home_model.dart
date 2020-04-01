import 'package:covid19/core/constants/enums.dart';
import 'package:covid19/core/models/covid_model.dart';
import 'package:covid19/core/services/api.dart';
import 'package:covid19/core/viewmodels/base_model.dart';

import '../../locator.dart';

class HomeViewModel extends BaseModel {
  Api _api = locator<Api>();
  CovidModel _covidModel;
  CovidModel get covidModel => _covidModel;
   
  Future getLatestData() async {
    setState(ViewState.Busy);
    _covidModel = await _api.getLatestData();
    setState(ViewState.Idle);
  }
}