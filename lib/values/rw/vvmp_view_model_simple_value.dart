
import 'package:flutter/material.dart';
import 'package:vvmp/values/rw/vvmp_base_view_model_rw_value.dart';
import 'package:vvmp/values/vvmp_base_view_model_value.dart';

class VvmpViewModelSimpleValue<T> extends VvmpBaseViewModelRwValue<T> { 
  @protected
  VvmpOnUpdateItem? innerOnUpdated;

  VvmpOnUpdateItem? get onUpdated => innerOnUpdated!;
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

  @override
  set value(T newValue) {
    super.innerValue = newValue;
    if(onUpdated == null){
      throw Exception('"onUpdated" callback in null!');
    }
    onUpdated!.callback();
  }

  VvmpViewModelSimpleValue(super.initValue);

  @override
  void resetCallback(State? state){
    innerOnUpdated = null;
  }

  void setWithSafeUpdating(T newValue){
    if(hasCallback){
      value = newValue;     
    }
    else{
      super.innerValue = newValue;         
    }
  }
  
  @override
  bool isAllowToSet() {
    return innerOnUpdated == null;
  }
}