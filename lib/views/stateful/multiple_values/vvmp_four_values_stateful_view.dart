import 'package:flutter/material.dart';
import 'package:vvmp/view_models/vvmp_view_model_value.dart';
import 'package:vvmp/views/stateful/vvmp_simple_stateful_view.dart';
import 'package:vvmp/views/stateful/multiple_values/vvmp_three_values_stateful_view.dart';

class VvmpFourValuesStatefulView extends VvmpThreeValuesStatefulView {
  final VvmpViewModelValue value4;

  const VvmpFourValuesStatefulView({super.key, required super.builder, required super.value, required super.value2, required super.value3, required this.value4});

  @override
  void initOnUpdates(Function(VoidCallback callback) setState){
    value.onUpdated = () { setState((){}); };
    value2.onUpdated = () { setState((){}); };
    value3.onUpdated = () { setState((){}); };
    value4.onUpdated = () { setState((){}); };
  }

  @override
  State<VvmpFourValuesStatefulView> createState() => VvmpSimpleStatefulViewState<VvmpFourValuesStatefulView>();
}