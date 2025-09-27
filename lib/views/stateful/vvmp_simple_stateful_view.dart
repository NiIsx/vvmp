import 'package:flutter/material.dart';
import 'package:vvmp/views/stateful/multiple_values/vvmp_base_stateful_view.dart';


class VvmpSimpleStatefulView extends VvmpBaseStatefulView {
  const VvmpSimpleStatefulView({super.key, required super.value, required super.builder, Function? onInitState});

  @override
  State<VvmpSimpleStatefulView> createState() => VvmpSimpleStatefulViewState();
}

@protected
class VvmpSimpleStatefulViewState<T extends VvmpSimpleStatefulView> extends VvmpBaseStatefulViewState<T> {



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