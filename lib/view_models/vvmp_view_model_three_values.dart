import 'package:vvmp/view_models/vvmp_view_model_two_values.dart';

class VvmpViewModelThreeValues<T> extends VvmpViewModelTwoValues{
  VvmpViewModelThreeValues(super.initValue, super.initValue2, T initValue3) : _value3 = initValue3;

  T _value3;
  T get value3 => _value3; 
  set value3(T newValue) {
    isInitialized = true;
    _value3 = newValue;
    if(onUpdated == null){
      throw Exception('"onUpdated" callback in null!');
    }
    onUpdated!();
  }
}