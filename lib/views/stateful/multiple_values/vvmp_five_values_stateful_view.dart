import 'package:flutter/material.dart';
import 'package:vvmp/view_models/vvmp_view_model_value.dart';
import 'package:vvmp/views/stateful/vvmp_simple_stateful_view.dart';
import 'package:vvmp/views/stateful/multiple_values/vvmp_four_values_stateful_view.dart';

class VvmpFiveValuesStatefulView extends VvmpFourValuesStatefulView {
  final VvmpViewModelValue value5;

  const VvmpFiveValuesStatefulView({super.key, required super.builder, required super.value, required super.value2, required super.value3, required super.value4, required this.value5});

  @override
  void initOnUpdates(Function(VoidCallback callback) setState){
    value.onUpdated = () { setState((){}); };
    value2.onUpdated = () { setState((){}); };
    value3.onUpdated = () { setState((){}); };
    value4.onUpdated = () { setState((){}); };
    value5.onUpdated = () { setState((){}); };
  }

  @override
  State<VvmpFiveValuesStatefulView> createState() => VvmpSimpleStatefulViewState<VvmpFiveValuesStatefulView>();
}