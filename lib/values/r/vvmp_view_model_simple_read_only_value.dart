
import 'package:flutter/material.dart';
import 'package:vvmp/values/r/vvmp_base_view_model_r_value.dart';
import 'package:vvmp/values/vvmp_base_view_model_value.dart';

class VvmpViewModelSimpleReadOnlyValue<T> extends VvmpBaseViewModelRValue<T> { 
  @protected
  VvmpOnUpdateItem? innerOnUpdated;

  VvmpOnUpdateItem? get onUpdated => innerOnUpdated;
  @override
  set onUpdated(VvmpOnUpdateItem? value){
    if(value == null){
      throw Exception('Value is null!');
    }
    if(innerOnUpdated != null){
      throw Exception('The onUpdated value is already been set!');
    }
    innerOnUpdated = value;
  }

  bool get hasCallback => onUpdated != null;

  VvmpViewModelSimpleReadOnlyValue(super.initValue);

  @override
  void resetCallback(State? state){
    innerOnUpdated = null;
  }
}