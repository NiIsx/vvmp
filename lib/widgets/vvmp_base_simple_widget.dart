import 'package:flutter/material.dart';
import 'package:vvmp/values/rw/vvmp_base_view_model_rw_value.dart';
import 'package:vvmp/values/vvmp_base_view_model_value.dart';
import 'package:vvmp/widgets/vvmp_base_widget.dart';


abstract class VvmpBaseSimpleWidget<T> extends VvmpBaseWidget {
  final VvmpBaseViewModelRwValue<T> value;
  
  const VvmpBaseSimpleWidget({super.key, required this.value});

  @override
  State<VvmpBaseSimpleWidget> createState();
}

@protected
abstract class VvmpBaseSimpleWidgetState<T extends VvmpBaseSimpleWidget> extends State<T> {
  bool isMounted = false;
  
  @protected
  @mustCallSuper
  void vvmpDispose(){}

  @override
  void dispose() {
    isMounted = false;
    widget.value.resetCallback(null);
    vvmpDispose();
    super.dispose();
  }
}