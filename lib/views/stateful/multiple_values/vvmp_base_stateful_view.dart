import 'package:flutter/material.dart';
import 'package:vvmp/view_models/vvmp_base_view_model.dart';


abstract class VvmpBaseStatefulView extends StatefulWidget {
  final VvmpBaseViewModel value;
  final Widget Function() builder;
  
  const VvmpBaseStatefulView({super.key, required this.value, required this.builder});

  @override
  State<VvmpBaseStatefulView> createState();
}

@protected
abstract class VvmpBaseStatefulViewState<T extends VvmpBaseStatefulView> extends State<T> {
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