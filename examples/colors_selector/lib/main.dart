import 'package:flutter/material.dart';
import 'package:vvmp/vvmp.dart';
import 'domains/main_domain.dart';
import 'ui/window/window_view_desktop.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter VVMP Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: WindowViewDesktop(vm: MainDomain().mainVM),
    );
  }
}
