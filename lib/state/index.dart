import 'package:flutter/cupertino.dart';


class ScreenTracking extends ChangeNotifier {

  String currentPage = 'home';

  String get getCurrentPage => currentPage;

  void changePage(pageName) {
    currentPage = pageName;
    // print(currentPage);
    notifyListeners();
  }

}