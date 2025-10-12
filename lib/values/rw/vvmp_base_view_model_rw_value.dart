
import 'package:vvmp/values/vvmp_base_view_model_value.dart';

abstract class VvmpBaseViewModelRwValue<T> extends VvmpBaseViewModelValue<T> {
  set value(T newValue);

  VvmpBaseViewModelRwValue(super.initValue);

  bool isAllowToSet();
}