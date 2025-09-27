import 'package:flutter/cupertino.dart';
import 'package:vvmp/view_models/vvmp_base_view_model.dart';

class VvmpViewModelValueReadOnly<T> extends VvmpBaseViewModel{
  @protected T innerValue;
  T get value => innerValue;
  bool get hasCallback => onUpdated != null; 

  @protected
  bool isInitialized = false;

  VvmpViewModelValueReadOnly(T initValue) : innerValue = initValue;

  void init(T value){
    if(isInitialized){
      throw Exception('Value already initialized!');
    }
    isInitialized = true;
    innerValue = value;
  }
}