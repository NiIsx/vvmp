import 'package:vvmp/models/vvmp_messages_callbacks.dart';

abstract class VvmpBaseProcedures {
  final VvmpMessagesCallbacks imc;

  VvmpBaseProcedures({required this.imc});
}