import 'package:flutter/material.dart';
import 'package:vvmp/widgets/vvmp_base_widget.dart';


class VvmpSimpleWidget extends VvmpBaseWidget {
  final Widget Function() builder;

  const VvmpSimpleWidget({super.key, required super.value, required this.builder, Function? onInitState});

  @override
  State<VvmpSimpleWidget> createState() => VvmpSimpleWidgetState();
}

@protected
class VvmpSimpleWidgetState<T extends VvmpSimpleWidget> extends VvmpBaseWidgetState<T> {



  @override
  Widget build(BuildContext context) {
    super.isMounted = true;

    // if(widget.value.onUpdated != null){
    //   throw Exception('The set VVMP view model already has handler for onUpdate!');
    // }

    if(widget.value.isAllowToSet()){
      widget.value.onUpdated = (){
        if (super.isMounted == true){
          setState((){});         
        }
      };      
    }

    return widget.builder();
  }
}