import 'package:covid19/core/models/covid_model.dart';
import 'package:get_it/get_it.dart';
import 'core/services/api.dart';
import 'core/viewmodels/home_model.dart';

final locator = GetIt.instance;

void setupLocator() {

  locator.registerLazySingleton(() => Api());  
  locator.registerFactory(() => HomeViewModel());
  locator.registerFactory(() => CovidModel());
}