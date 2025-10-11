import 'package:flutter/cupertino.dart';
import 'package:vvmp/values/vvmp_base_view_model_value.dart';

class VvmpViewModelValueReadOnly<T> extends VvmpBaseViewModelValue{
  @protected T innerValue;
  T get value => innerValue;
  bool get hasCallback => onUpdated != null; 

  //@protected
  //bool isInitialized = false;

  VvmpViewModelValueReadOnly(T initValue) : innerValue = initValue{
    //bool isInitialized = ;
  }
}