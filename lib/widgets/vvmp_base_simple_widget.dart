import 'package:flutter/material.dart';
import 'package:vvmp/values/rw/vvmp_view_model_simple_value.dart';
import 'package:vvmp/values/vvmp_base_view_model_value.dart';
import 'package:vvmp/widgets/vvmp_base_widget.dart';


abstract class VvmpBaseSimpleWidget<T> extends VvmpBaseWidget {
  final VvmpViewModelSimpleValue<T> value;
  
  const VvmpBaseSimpleWidget({super.key, required this.value});

  @override
  State<VvmpBaseSimpleWidget> createState();
}

@protected
abstract class VvmpBaseSimpleWidgetState<T extends VvmpBaseSimpleWidget> extends State<T> {
  
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
    if (widget.value.isAllowToSet()) {
      widget.value.onUpdated = VvmpOnUpdateItem(
        state: this,
        callback: () {
          if (!mounted) return;
          setState(() {});
        },
      );
    }
  }

  @override
  void didUpdateWidget(covariant T oldWidget) {
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
