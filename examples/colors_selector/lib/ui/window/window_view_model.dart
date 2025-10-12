import 'package:vvmp/vvmp.dart';
import '../screens/first_screen/first_screen_view_model.dart';
import '../screens/second_screen/second_screen_view_model.dart';

class WindowViewModel extends VvmpBaseViewModel {
  WindowViewModel({
    required this.firstScreenVM,
    required this.secondScreenVM,
  });

  final FirstScreenViewModel firstScreenVM;
  final SecondScreenViewModel secondScreenVM;

  final VvmpViewModelValue<int> secectedMenuItemIndex = VvmpViewModelValue<int>(0);
}
