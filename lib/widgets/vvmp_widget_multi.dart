import 'package:flutter/material.dart';
import 'package:vvmp/values/rw/vvmp_base_view_model_rw_value.dart';
import 'package:vvmp/values/vvmp_base_view_model_value.dart';


class VvmpWidgetMulti extends StatefulWidget {
  final VvmpBaseViewModelRwValue value;
  final Widget Function() builder;
  
  const VvmpWidgetMulti({super.key, required this.value, required this.builder});

  @override
  State<VvmpWidgetMulti> createState() => VvmpWidgetMultiState();
}

@protected
class VvmpWidgetMultiState<T extends VvmpWidgetMulti> extends State<T> {
  bool isMounted = false;
  
  @protected
  @mustCallSuper
  void vvmpDispose(){}

  @override
  void dispose() {
    isMounted = false;
    widget.value.resetCallback(this);
    vvmpDispose();
    super.dispose();
  }

  @override 
  void initState() { 
    super.initState(); 
    widget.value.onUpdated = VvmpOnUpdateItem(
      state: this, 
      callback: () => isMounted ? setState(() {}) : null
    ); 
  }

  @override
  Widget build(BuildContext context) {
    isMounted = true;

    return widget.builder();
  }
}