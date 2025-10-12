import 'package:test_create_vvmp_by_ai_2/ui/screens/second_screen/second_screen_view_model.dart';
import 'package:vvmp/vvmp.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class SecondProcedures extends VvmpBaseProcedures {
  SecondScreenViewModel vm;

  SecondProcedures({required super.imc, required this.vm});

  final _random = Random();
  
  // Генерирует случайный цвет
  Color _generateRandomColor() {
    return Color.fromARGB(
      255,
      _random.nextInt(256),
      _random.nextInt(256),
      _random.nextInt(256),
    );
  }

  // Изменяет цвет первого квадрата
  void changeFirstSquareColor() {
    final newColor = _generateRandomColor();
    vm.firstSquareColor.value = newColor;
    vm.tapsNum.value++;
    imc.onInfoCallback('Первый квадрат получил новый цвет: ${newColor.toString()}');
  }

  // Изменяет цвет второго квадрата
  void changeSecondSquareColor() {
    final newColor = _generateRandomColor();
    vm.secondSquareColor.value = newColor;
    vm.tapsNum.value++;
    imc.onInfoCallback('Второй квадрат получил новый цвет: ${newColor.toString()}');
  }

  // Изменяет цвет третьего квадрата
  void changeThirdSquareColor() {
    final newColor = _generateRandomColor();
    vm.thirdSquareColor.value = newColor;
    vm.tapsNum.value++;
    imc.onInfoCallback('Третий квадрат получил новый цвет: ${newColor.toString()}');
  }

  // Инициализация цветов
  Future<void> initColors() async {
    imc.onInfoCallback('Цвета инициализированы');
  }
}
