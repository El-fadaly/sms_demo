import 'package:flutter/material.dart';
import 'package:sms_demo/app/app.dart';
import 'package:sms_demo/app/dependencies/dependencies_core.dart';

void main() {
  DependenciesCore.init();
  runApp(const App());
}
