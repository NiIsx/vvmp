import 'package:flutter/material.dart';

abstract class VvmpBaseViewModelValue<T> {
  @protected T innerValue;
  T get value => innerValue;

  set onUpdated(VvmpOnUpdateItem item);

  VvmpBaseViewModelValue(T initValue) : innerValue = initValue;

  void resetCallback(State? state);
}

class VvmpOnUpdateItem{
  final State state;
  final void Function() callback;

  VvmpOnUpdateItem({required this.state, required this.callback});
}