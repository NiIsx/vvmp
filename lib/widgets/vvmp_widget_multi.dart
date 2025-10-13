import 'package:flutter/material.dart';
import 'package:vvmp/values/rw/vvmp_view_model_simple_value.dart';
import 'package:vvmp/values/vvmp_base_view_model_value.dart';


class VvmpWidgetMulti<T> extends StatefulWidget {
  final VvmpViewModelSimpleValue<T> value;
  final Widget Function() builder;
  
  const VvmpWidgetMulti({super.key, required this.value, required this.builder});
  
  @override
  State<VvmpWidgetMulti<T>> createState() => VvmpWidgetMultiState<T>();
}

@protected
class VvmpWidgetMultiState<T> extends State<VvmpWidgetMulti<T>> {
  
  @protected
  @mustCallSuper
  void vvmpDispose(){}

  @override
  void dispose() {
    widget.value.resetCallback(this);
    vvmpDispose();
    super.dispose();
  }

  @override 
  void initState() { 
    super.initState(); 
    widget.value.onUpdated = VvmpOnUpdateItem(
      state: this,
      callback: () {
        if (!mounted) return;
        setState(() {});
      },
    ); 
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder();
  }

  @override
  void didUpdateWidget(covariant VvmpWidgetMulti<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (identical(widget.value, oldWidget.value)) return;

    // Detach from old value (must pass this state)
    oldWidget.value.resetCallback(this);

    // Attach to new value
    widget.value.onUpdated = VvmpOnUpdateItem(
      state: this,
      callback: () {
        if (!mounted) return;
        setState(() {});
      },
    );
  }
}