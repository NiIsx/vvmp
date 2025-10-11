import 'package:flutter/foundation.dart';

abstract class VvmpBaseViewModelValue {
  @protected
  void Function()? innerOnUpdated = null;

  void Function()? get onUpdated => innerOnUpdated;
  set onUpdated(void Function()? value){
    if(innerOnUpdated != null){
      throw Exception('The onUpdated value is already been set!');
    }
    innerOnUpdated = value;
  }

  void resetCallback(){
    innerOnUpdated = null;
  }

  bool isAllowToSet(){
    return onUpdated == null;
  }
}