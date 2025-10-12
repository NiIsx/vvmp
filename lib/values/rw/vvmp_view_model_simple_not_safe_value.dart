import 'package:vvmp/values/rw/vvmp_view_model_simple_value.dart';

class VvmpViewModelSimpleNotSafeValue<T> extends VvmpViewModelSimpleValue<T> { 
  @override
  set value(T newValue) {
    super.innerValue = newValue;
    if(onUpdated != null){
      onUpdated!.callback();
    }
  }

  VvmpViewModelSimpleNotSafeValue(super.initValue);
}