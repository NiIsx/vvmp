import 'package:flutter/material.dart';
import 'package:vvmp/values/vvmp_base_view_model_value.dart';
import 'package:vvmp/widgets/vvmp_base_simple_widget.dart';


class VvmpSimpleWidget<V> extends VvmpBaseSimpleWidget<V> {
  final Widget Function() builder;

  const VvmpSimpleWidget({super.key, required super.value, required this.builder, Function? onInitState});

  @override
  State<VvmpSimpleWidget> createState() => VvmpSimpleWidgetState();
}

@protected
class VvmpSimpleWidgetState<T extends VvmpSimpleWidget> extends VvmpBaseSimpleWidgetState<T> {



  @override
  Widget build(BuildContext context) {
    super.isMounted = true;

    // if(widget.value.onUpdated != null){
    //   throw Exception('The set VVMP view model already has handler for onUpdate!');
    // }

    if(widget.value.isAllowToSet()){
      widget.value.onUpdated = VvmpOnUpdateItem(
        state: this, 
        callback: (){
          if (super.isMounted == true){
            setState((){});         
          }
        }
      );
    }

    return widget.builder();
  }
}