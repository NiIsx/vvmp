
import 'package:vvmp/models/exceptions/vvmp_exceptions.dart';

class VvmpMessagesCallbacks{
  final void Function(String info) onInfoCallback;
  final void Function(String warning) onWarningCallback;
  final void Function(VvmpException exception) onErrorCallback;

  VvmpMessagesCallbacks({required this.onInfoCallback, required this.onWarningCallback, required this.onErrorCallback});
}
