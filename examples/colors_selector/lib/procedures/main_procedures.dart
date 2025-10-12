import 'package:test_create_vvmp_by_ai_2/procedures/first/first_procedures.dart';
import 'package:test_create_vvmp_by_ai_2/procedures/second/second_procedures.dart';
import 'package:test_create_vvmp_by_ai_2/ui/screens/first_screen/first_screen_view_model.dart';
import 'package:test_create_vvmp_by_ai_2/ui/screens/second_screen/second_screen_view_model.dart';
import 'package:vvmp/vvmp.dart';

class MainProcedures extends VvmpBaseProcedures {
  
  final FirstScreenViewModel firstVM;
  final SecondScreenViewModel secondVM;
  
  late final first = FirstProcedures(imc: imc, vm: firstVM);
  late final second = SecondProcedures(imc: imc, vm: secondVM);

  MainProcedures({
    required super.imc,
    required this.firstVM,
    required this.secondVM,
  });
}
