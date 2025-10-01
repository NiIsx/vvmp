import 'package:flutter/material.dart';
import 'package:vvmp/view_models/vvmp_view_model_value.dart';
import 'package:vvmp/widgets/vvmp_widget_simple.dart';

class VvmpTwoValuesWidget extends VvmpSimpleWidget {
  final VvmpViewModelValue value2;

  const VvmpTwoValuesWidget({super.key, required super.builder, required super.value, required this.value2});

  @override
  void initOnUpdates(Function(VoidCallback callback) setState){
    value.onUpdated = () { setState((){}); };
    value2.onUpdated = () { setState((){}); };
  }

  @override
  State<VvmpTwoValuesWidget> createState() => VvmpSimpleWidgetState<VvmpTwoValuesWidget>();
}