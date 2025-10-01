import 'package:flutter/material.dart';
import 'package:vvmp/view_models/vvmp_base_view_model.dart';


abstract class VvmpBaseWidget extends StatefulWidget {
  final VvmpBaseViewModel value;
  final Widget Function() builder;
  
  const VvmpBaseWidget({super.key, required this.value, required this.builder});

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
    vvmpDispose();
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