import 'package:flutter/widgets.dart';
import 'package:vvmp/view_models/vvmp_base_view_model.dart';

abstract class VvmpBaseStatelessView<T extends VvmpBaseViewModel> extends StatelessWidget{
  final T vm;
  
  const VvmpBaseStatelessView({super.key, required this.vm});
}