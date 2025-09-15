import 'package:flutter/material.dart';

import 'app.dart';
import 'src/shared/config/app_di.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runMainApp();
}

Future<void> runMainApp() async {
  await configureDependencies();

  /// Entry Points
  runApp(const CoreApp());
}
