import 'package:flutter/widgets.dart';
import 'package:vvmp/view_models/vvmp_base_view_model.dart';

abstract class VvmpBaseStatefulView<T extends VvmpBaseViewModel> extends StatefulWidget{
  final T vm;
  
  const VvmpBaseStatefulView({super.key, required this.vm});

  @override
  State<VvmpBaseStatefulView> createState();
}

@protected
abstract class VvmpBaseStatefulViewState<T extends VvmpBaseStatefulView> extends State<T> {

}