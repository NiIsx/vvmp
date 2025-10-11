import 'package:flutter/material.dart';
import 'package:vvmp/values/vvmp_base_view_model_value.dart';


abstract class VvmpBaseWidget extends StatefulWidget {
  final VvmpBaseViewModelValue value;
  
  const VvmpBaseWidget({super.key, required this.value});

  @override
  State<VvmpBaseWidget> createState();
}

@protected
abstract class VvmpBaseWidgetState<T extends VvmpBaseWidget> extends State<T> {
  bool isMounted = false;
  
  @protected
  @mustCallSuper
  void vvmpDispose(){}

  @override
  void dispose() {
    isMounted = false;
    widget.value.resetCallback();
    vvmpDispose();
    super.dispose();
  }
}