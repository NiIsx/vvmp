import 'package:flutter/material.dart';
import 'package:vvmp/views/stateful/vvmp_simple_stateful_view.dart';


class VvmpSimpleStatefulCallbackedView extends VvmpSimpleStatefulView {
  Function? onInitState;
  Function? disposed;

  VvmpSimpleStatefulCallbackedView({super.key, required super.value, required super.builder, Function? initState, Function? disposed});

  @override
  State<VvmpSimpleStatefulCallbackedView> createState() => VvmpSimpleStatefulCallbackedViewState();
}

@protected
class VvmpSimpleStatefulCallbackedViewState<T extends VvmpSimpleStatefulCallbackedView> extends VvmpSimpleStatefulViewState<T> {

  @override
  void initState(){
    super.initState();
    if(widget.onInitState != null){
      widget.onInitState!();
    }
  }

  @override
  void dispose() {
    if(widget.disposed != null){
      widget.disposed!();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    isMounted = true;

    widget.value.onUpdated = (){
      if (isMounted == true){
        setState((){});         
      }
    };
    return widget.builder();
  }
}