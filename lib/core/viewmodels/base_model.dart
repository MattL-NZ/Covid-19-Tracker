import 'package:covid19/core/constants/enums.dart';
import 'package:flutter/widgets.dart';

class BaseModel extends  ChangeNotifier{
  ViewState _state = ViewState.Idle;
  ViewState get state => _state;

  setState(ViewState state) {
    _state = state;
    notifyListeners();
  }
}