import 'package:flutter/cupertino.dart';
import 'package:vvmp/values/vvmp_view_model_value_read_only.dart';

class VvmpViewModelValueNotSafe<T> extends VvmpViewModelValueReadOnly<T>{ //Not generating exception when onUpdate == null 
  set value(T newValue) {
    //isInitialized = true;
    super.innerValue = newValue;
    if(onUpdated != null){
      onUpdated!();
    }
  }

  @protected
  VvmpViewModelValueNotSafe(super.initValue);
}