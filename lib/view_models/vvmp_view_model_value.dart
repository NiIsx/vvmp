import 'package:flutter/cupertino.dart';
import 'package:vvmp/view_models/vvmp_view_model_value_read_only.dart';

class VvmpViewModelValue<T> extends VvmpViewModelValueReadOnly<T>{
  set value(T newValue) {
    isInitialized = true;
    super.innerValue = newValue;
    if(onUpdated == null){
      throw Exception('"onUpdated" callback in null!');
    }
    onUpdated!();
  }

  @protected
  VvmpViewModelValue(super.initValue);
}