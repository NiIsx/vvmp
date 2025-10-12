import 'package:flutter/cupertino.dart';


class VvmpViewModelMultiValues<T>{
  @protected T innerValue;
  final List<VvmpOnUpdateItem> _onUpdateds = [];

  T get value => innerValue;
  set value(T newValue) {
    innerValue = newValue;
    for (final item in _onUpdateds){
      item.callback();      
    }
  }

  set onUpdated(VvmpOnUpdateItem value){
    final selection = _onUpdateds.where((item)=>item.state == value.state);
    if(selection.isNotEmpty){
      throw Exception('The onUpdated value is already been set!');      
    }
    _onUpdateds.add(value);
  }

  void resetCallback(State state){
    _onUpdateds.removeWhere((item)=>item.state == state);
  }

  @protected
  VvmpViewModelMultiValues(T initValue) : innerValue = initValue;
}


class VvmpOnUpdateItem{
  final State state;
  final void Function() callback;

  VvmpOnUpdateItem({required this.state, required this.callback});
}