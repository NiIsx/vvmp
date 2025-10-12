import 'package:vvmp/vvmp.dart';
import 'package:flutter/material.dart';
import 'second_screen_view_model.dart';

class SecondScreenViewDesktop extends VvmpBaseStatelessView<SecondScreenViewModel> {
  const SecondScreenViewDesktop({super.key, required super.vm});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Второй экран'),
        backgroundColor: Colors.purple[100],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            VvmpWidgetMulti(
              value: vm.tapsNum,
              builder: () {
                return Text('Taps num: ${vm.tapsNum.value}');
              }
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                VvmpSimpleWidget(
                  value: vm.firstSquareColor,
                  builder: () => GestureDetector(
                    onTap: vm.onFirstSquareTap,
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: vm.firstSquareColor.value,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                VvmpSimpleWidget(
                  value: vm.secondSquareColor,
                  builder: () => GestureDetector(
                    onTap: vm.onSecondSquareTap,
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: vm.secondSquareColor.value,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                VvmpSimpleWidget(
                  value: vm.thirdSquareColor,
                  builder: () => GestureDetector(
                    onTap: vm.onThirdSquareTap,
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: vm.thirdSquareColor.value,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            const Text(
              'Нажмите на квадрат, чтобы изменить цвет следующего',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
