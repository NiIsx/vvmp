import 'package:vvmp/vvmp.dart';
import 'package:flutter/material.dart';

class FirstScreenViewModel extends VvmpBaseViewModel {
  FirstScreenViewModel({
    required this.onFirstSquareTap,
    required this.onSecondSquareTap,
    required this.onThirdSquareTap,
  });

  final VoidCallback onFirstSquareTap;
  final VoidCallback onSecondSquareTap;
  final VoidCallback onThirdSquareTap;

  final firstSquareColor = VvmpViewModelValue<Color>(Colors.red);
  final secondSquareColor = VvmpViewModelValue<Color>(Colors.green);
  final thirdSquareColor = VvmpViewModelValue<Color>(Colors.blue);
}
