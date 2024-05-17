import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier{

  ConnectivityResult connectivityResult =ConnectivityResult.none;

  void checkingConnection(){

    Connectivity().onConnectivityChanged.listen((event) {
      connectivityResult=event;
      notifyListeners();
    });

  }


}