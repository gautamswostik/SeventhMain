import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:seventh_main/dependencyinjection/get_it.dart' as getIt;
import 'package:pedantic/pedantic.dart';
import 'package:seventh_main/screens/seventh_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  unawaited(
      SystemChrome.setPreferredOrientations(([DeviceOrientation.portraitUp])));
  unawaited(getIt.init());
  runApp(SeventhApp());
}
