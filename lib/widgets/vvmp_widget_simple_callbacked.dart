import 'package:flutter/material.dart';
import 'package:vvmp/widgets/vvmp_base_widget.dart';


class VvmpWidgetSimpleCallbacked extends VvmpBaseWidget {
  Function? onInitState;
  Function? disposed;

  VvmpWidgetSimpleCallbacked({super.key, required super.value, required super.builder, Function? initState, Function? disposed});

  @override
  State<VvmpWidgetSimpleCallbacked> createState() => VvmpWidgetSimpleCallbackedState();
}

@protected
class VvmpWidgetSimpleCallbackedState<T extends VvmpWidgetSimpleCallbacked> extends VvmpBaseWidgetState<T> {

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