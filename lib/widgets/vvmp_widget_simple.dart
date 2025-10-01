import 'package:flutter/material.dart';
import 'package:vvmp/widgets/vvmp_base_widget.dart';


class VvmpSimpleWidget extends VvmpBaseWidget {
  const VvmpSimpleWidget({super.key, required super.value, required super.builder, Function? onInitState});

  @override
  State<VvmpSimpleWidget> createState() => VvmpSimpleWidgetState();
}

@protected
class VvmpSimpleWidgetState<T extends VvmpSimpleWidget> extends VvmpBaseWidgetState<T> {



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