import 'package:vvmp/vvmp.dart';
import 'package:flutter/material.dart';

class SecondScreenViewModel extends VvmpBaseViewModel {
  SecondScreenViewModel({
    required this.onFirstSquareTap,
    required this.onSecondSquareTap,
    required this.onThirdSquareTap,
  });

  final VoidCallback onFirstSquareTap;
  final VoidCallback onSecondSquareTap;
  final VoidCallback onThirdSquareTap;

  final firstSquareColor = VvmpViewModelValue<Color>(Colors.purple);
  final secondSquareColor = VvmpViewModelValue<Color>(Colors.orange);
  final thirdSquareColor = VvmpViewModelValue<Color>(Colors.teal);
}
