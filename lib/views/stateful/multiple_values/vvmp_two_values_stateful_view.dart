import 'package:flutter/material.dart';
import 'package:vvmp/view_models/vvmp_view_model_value.dart';
import 'package:vvmp/views/stateful/vvmp_simple_stateful_view.dart';

class VvmpTwoValuesStatefulView extends VvmpSimpleStatefulView {
  final VvmpViewModelValue value2;

  const VvmpTwoValuesStatefulView({super.key, required super.builder, required super.value, required this.value2});

  @override
  void initOnUpdates(Function(VoidCallback callback) setState){
    value.onUpdated = () { setState((){}); };
    value2.onUpdated = () { setState((){}); };
  }

  @override
  State<VvmpTwoValuesStatefulView> createState() => VvmpSimpleStatefulViewState<VvmpTwoValuesStatefulView>();
}