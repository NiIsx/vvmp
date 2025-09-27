import 'package:vvmp/vvmp.dart';
import '../procedures/main_procedures.dart';
import '../ui/screens/first_screen/first_screen_view_model.dart';
import '../ui/screens/first_screen/first_screen_view_desktop.dart';
import '../ui/screens/second_screen/second_screen_view_model.dart';
import '../ui/screens/second_screen/second_screen_view_desktop.dart';
import '../ui/window/window_view_model.dart';

class MainDomain {
  late final FirstScreenViewModel firstScreenVM;
  late final firstScreen = FirstScreenViewDesktop(vm: firstScreenVM);

  late final SecondScreenViewModel secondScreenVM;
  late final secondScreen = SecondScreenViewDesktop(vm: secondScreenVM);

  late final mainVM = WindowViewModel(
    firstScreenVM: firstScreenVM,
    secondScreenVM: secondScreenVM,
  );

  late final procedures = MainProcedures(imc: VvmpMessagesCallbacks(
    onInfoCallback: onInfoCallback, 
    onWarningCallback: onWarningCallback, 
    onErrorCallback: onErrorCallback,
  ));

  MainDomain(){
    firstScreenVM = FirstScreenViewModel(
      onFirstSquareTap: () => procedures.changeSecondSquareColor(
        (color) => firstScreenVM.secondSquareColor.value = color
      ),
      onSecondSquareTap: () => procedures.changeThirdSquareColor(
        (color) => firstScreenVM.thirdSquareColor.value = color
      ),
      onThirdSquareTap: () => procedures.changeFirstSquareColor(
        (color) => firstScreenVM.firstSquareColor.value = color
      ),
    );
    
    secondScreenVM = SecondScreenViewModel(
      onFirstSquareTap: () => procedures.changeSecondSquareColor(
        (color) => secondScreenVM.secondSquareColor.value = color
      ),
      onSecondSquareTap: () => procedures.changeThirdSquareColor(
        (color) => secondScreenVM.thirdSquareColor.value = color
      ),
      onThirdSquareTap: () => procedures.changeFirstSquareColor(
        (color) => secondScreenVM.firstSquareColor.value = color
      ),
    );
  }

  Future<void> init() async {
    // Инициализация цветов
    await procedures.initColors();
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
