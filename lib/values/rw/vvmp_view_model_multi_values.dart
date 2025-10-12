
import 'package:flutter/material.dart';
import 'package:vvmp/values/rw/vvmp_base_view_model_rw_value.dart';
import 'package:vvmp/values/vvmp_base_view_model_value.dart';

class VvmpViewModelMultiValues<T> extends VvmpBaseViewModelRwValue<T> { 
  @override
  set onUpdated(VvmpOnUpdateItem value){
    final selection = _onUpdateds.where((item)=>item.state == value.state);
    if(selection.isNotEmpty){
      throw Exception('The onUpdated value is already been set!');      
    }
    _onUpdateds.add(value);
  }

  @override
  set value(T newValue) {
    innerValue = newValue;
    for (final item in _onUpdateds){
      item.callback();      
    }
  }

  final List<VvmpOnUpdateItem> _onUpdateds = [];


  VvmpViewModelMultiValues(super.initValue);

  @override
  void resetCallback(State? state){
    _onUpdateds.removeWhere((item)=>item.state == state);
  }
  
  @override
  bool isAllowToSet() {
    return true;
  }
}