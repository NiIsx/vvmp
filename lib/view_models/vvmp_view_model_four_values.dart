import 'package:vvmp/view_models/vvmp_view_model_three_values.dart';

class VvmpViewModelFourValues<T> extends VvmpViewModelThreeValues{
  VvmpViewModelFourValues(super.initValue, super.initValue2, super.initValue3, T initValue4) : _value4 = initValue4;

  T _value4;
  T get value4 => _value4; 
  set value4(T newValue) {
    isInitialized = true;
    _value4 = newValue;
    if(onUpdated == null){
      throw Exception('"onUpdated" callback in null!');
    }
    onUpdated!();
  }
}