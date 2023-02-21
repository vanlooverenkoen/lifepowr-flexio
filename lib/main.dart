import 'package:flexio_kvl/app.dart';
import 'package:flexio_kvl/di/injectable.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const FlexioApp());
}
