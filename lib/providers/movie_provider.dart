import 'package:flutter/material.dart';

class MovieProvider with ChangeNotifier{
  
  List favlist = [];

  addtoList(index){
    favlist.add(index);
    notifyListeners();
  }

  removeFav(index){
    favlist.remove(index);
    notifyListeners();


  }

}