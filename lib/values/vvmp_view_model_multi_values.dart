import 'package:flutter/cupertino.dart';
import 'package:vvmp/vvmp.dart';

class VvmpViewModelMultiValues<T> extends VvmpViewModelValue<T>{
  final List<Function()?> _onUpdateds = [];

  @override
  void Function()? get onUpdated {
    throw Exception('onUpdate in multi values is not allowing getter!');
  }
  @override
  set onUpdated(void Function()? value){
    if(_onUpdateds.contains(value)){
      throw Exception('The onUpdated value is already been set!');      
    }
    _onUpdateds.add(value);
  }

  @override
  set value(T newValue) {
    //isInitialized = true;
    super.innerValue = newValue;
    for (final item in _onUpdateds){
      if(item == null){
        throw Exception('Item of "onUpdateds" callback in null!');
      }
      item();      
    }
  }

  @protected
  VvmpViewModelMultiValues(super.initValue);

  @override
  bool isAllowToSet(){
    return true;
  }

  @override
  void resetCallback(){
    _onUpdateds.clear();
  }

  // void setWithoutUpdating(T newValue){
  //   super.innerValue = newValue;
  // }
  void setWithSafeUpdating(T newValue){
    if(super.hasCallback){
      value = newValue;     
    }
    else{
      super.innerValue = newValue;         
    }
  }
}