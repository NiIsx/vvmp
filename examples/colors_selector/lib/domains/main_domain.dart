import 'package:vvmp/vvmp.dart';
import '../procedures/main_procedures.dart';
import '../ui/screens/first_screen/first_screen_view_model.dart';
import '../ui/screens/first_screen/first_screen_view_desktop.dart';
import '../ui/screens/second_screen/second_screen_view_model.dart';
import '../ui/screens/second_screen/second_screen_view_desktop.dart';
import '../ui/window/window_view_model.dart';

class MainDomain {
  late FirstScreenViewModel firstScreenVM;
  late final firstScreen = FirstScreenViewDesktop(vm: firstScreenVM);

  late SecondScreenViewModel secondScreenVM;
  late final secondScreen = SecondScreenViewDesktop(vm: secondScreenVM);

  late final mainVM = WindowViewModel(
    firstScreenVM: firstScreenVM,
    secondScreenVM: secondScreenVM,
  );

  late final procedures = MainProcedures(
    imc: VvmpMessagesCallbacks( 
      onInfoCallback: onInfoCallback, 
      onWarningCallback: onWarningCallback, 
      onErrorCallback: onErrorCallback,
    ),
    firstVM: firstScreenVM, 
    secondVM: secondScreenVM, 
  );

  MainDomain(){
    firstScreenVM = FirstScreenViewModel(
      onFirstSquareTap: () => procedures.first.changeSecondSquareColor(),
      onSecondSquareTap: () => procedures.first.changeThirdSquareColor(),
      onThirdSquareTap: () => procedures.first.changeFirstSquareColor(),
    );
    
    secondScreenVM = SecondScreenViewModel(
      onFirstSquareTap: () => procedures.second.changeSecondSquareColor(),
      onSecondSquareTap: () => procedures.second.changeThirdSquareColor(),
      onThirdSquareTap: () => procedures.second.changeFirstSquareColor(),
    );
  }

  Future<void> init() async {
    // Инициализация цветов
    await procedures.first.initColors();
    await procedures.second.initColors();
  }

  void onInfoCallback(String info) {
    // Обработка информационных сообщений
  }

  void onWarningCallback(String warning) {
    // Обработка предупреждений
  }

  void onErrorCallback(VvmpException exception) {
    // Обработка ошибок
  }
}
