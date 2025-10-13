import 'package:vvmp/values/rw/vvmp_view_model_simple_value.dart';

class VvmpViewModelSimpleNotSafeValue<T> extends VvmpViewModelSimpleValue<T> { 
  @override
  set value(T newValue) {
    if (newValue == super.innerValue) {
      return;
    }
    super.innerValue = newValue;
    innerOnUpdated?.callback();
  }

  VvmpViewModelSimpleNotSafeValue(super.initValue);
}