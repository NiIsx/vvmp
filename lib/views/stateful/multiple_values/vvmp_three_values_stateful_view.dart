import 'package:flutter/material.dart';
import 'package:vvmp/view_models/vvmp_view_model_value.dart';
import 'package:vvmp/views/stateful/vvmp_simple_stateful_view.dart';
import 'package:vvmp/views/stateful/multiple_values/vvmp_two_values_stateful_view.dart';

class VvmpThreeValuesStatefulView extends VvmpTwoValuesStatefulView {
  final VvmpViewModelValue value3;

  const VvmpThreeValuesStatefulView({super.key, required super.builder, required super.value, required super.value2, required this.value3});

  @override
  void initOnUpdates(Function(VoidCallback callback) setState){
    value.onUpdated = () { setState((){}); };
    value2.onUpdated = () { setState((){}); };
    value3.onUpdated = () { setState((){}); };
  }

  @override
  State<VvmpThreeValuesStatefulView> createState() => VvmpSimpleStatefulViewState<VvmpThreeValuesStatefulView>();
}