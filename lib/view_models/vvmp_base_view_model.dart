import 'package:flutter/material.dart';

abstract class VvmpBaseViewModel {
  @protected
  void Function()? onUpdated = null;
}