
import 'package:flutter/material.dart';
import 'package:vvmp/values/r/vvmp_view_model_simple_read_only_value.dart';
import 'package:vvmp/values/vvmp_base_view_model_value.dart';

class VvmpViewModelSimpleValue<T> extends VvmpViewModelSimpleReadOnlyValue<T> { 

  @override
  set onUpdated(VvmpOnUpdateItem value){
    super.isCallbackInitialized = true;
    if(innerOnUpdated != null){
      throw Exception('The onUpdated value is already been set!');
    }
    innerOnUpdated = value;
  }

  set value(T newValue) {
    if ((newValue == super.innerValue) && !(super.innerValue is Iterable)) {
      return;
    }
    super.innerValue = newValue;
    if(super.isCallbackInitialized == false){
      throw Exception('"onUpdated" callback in not initialized!');
    }
    innerOnUpdated?.callback();
  }

  VvmpViewModelSimpleValue(super.initValue);

  @override
  void resetCallback(State? state){
    innerOnUpdated = null;
  }

  void setWithSafeUpdating(T newValue){
    if (newValue == super.innerValue) {
      return;
    }
    if(hasCallback){
      value = newValue;     
    }
    else{
      super.innerValue = newValue;         
    }
  }
  
  bool isAllowToSet() {
    return innerOnUpdated == null;
  }
}
