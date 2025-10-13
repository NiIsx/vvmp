
import 'package:flutter/material.dart';
import 'package:vvmp/values/rw/vvmp_view_model_simple_value.dart';
import 'package:vvmp/values/vvmp_base_view_model_value.dart';

class VvmpViewModelMultiValues<T> extends VvmpViewModelSimpleValue<T> { 
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
    if (newValue == innerValue) {
      return;
    }
    innerValue = newValue;
    final callbacks = List<VvmpOnUpdateItem>.from(_onUpdateds);
    for (final item in callbacks) {
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
