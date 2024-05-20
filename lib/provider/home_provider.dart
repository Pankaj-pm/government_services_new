import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier{

  ConnectivityResult connectivityResult =ConnectivityResult.none;
  bool isLoad=true;

  void checkingConnection(){

    Connectivity().onConnectivityChanged.listen((event) {
      connectivityResult=event;
      notifyListeners();
    });

  }
  void onChangeLoad(bool isLoad){
    this.isLoad=isLoad;
    notifyListeners();
  }


}