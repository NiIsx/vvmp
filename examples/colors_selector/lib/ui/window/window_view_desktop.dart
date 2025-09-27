import 'package:vvmp/vvmp.dart';
import 'package:flutter/material.dart';
import 'window_view_model.dart';
import '../screens/first_screen/first_screen_view_desktop.dart';
import '../screens/second_screen/second_screen_view_desktop.dart';

class WindowViewDesktop extends VvmpBaseStatelessView<WindowViewModel> {
  const WindowViewDesktop({super.key, required super.vm});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Боковое меню
          Container(
            width: 250,
            color: Colors.grey[100],
            child: Column(
              children: [
                Container(
                  height: 60,
                  color: Colors.blue[600],
                  child: const Center(
                    child: Text(
                      'Меню',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                _buildMenuItem(
                  icon: Icons.home,
                  title: 'Первый экран',
                  isSelected: vm.currentScreenIndex.value == 0,
                  onTap: vm.switchToFirstScreen,
                ),
                _buildMenuItem(
                  icon: Icons.settings,
                  title: 'Второй экран',
                  isSelected: vm.currentScreenIndex.value == 1,
                  onTap: vm.switchToSecondScreen,
                ),
              ],
            ),
          ),
          // Основной контент
          Expanded(
            child: VvmpSimpleStatefulView(
              value: vm.currentScreenIndex,
              builder: () {
                switch (vm.currentScreenIndex.value) {
                  case 0:
                    return FirstScreenViewDesktop(vm: vm.firstScreenVM);
                  case 1:
                    return SecondScreenViewDesktop(vm: vm.secondScreenVM);
                  default:
                    return FirstScreenViewDesktop(vm: vm.firstScreenVM);
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: ListTile(
        leading: Icon(
          icon,
          color: isSelected ? Colors.blue[600] : Colors.grey[600],
        ),
        title: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.blue[600] : Colors.grey[700],
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        tileColor: isSelected ? Colors.blue[50] : Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        onTap: onTap,
      ),
    );
  }
}
