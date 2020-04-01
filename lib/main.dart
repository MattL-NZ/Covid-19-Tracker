import 'package:covid19/ui/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:covid19/locator.dart';
import 'core/viewmodels/home_model.dart';

void main() {
  // Call the setupLocator method when the app is first created to get dependency injection activated
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeViewModel>(
      create: (context) => locator<HomeViewModel>(),
      child: MaterialApp(
        title: 'COVID-19',
        theme: ThemeData(),
        home: HomeView(),
        debugShowCheckedModeBanner: false
      ),
    );
  }
}
