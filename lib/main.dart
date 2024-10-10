import 'package:app_music/shared/database_service/database_services.dart';
import 'package:flutter/material.dart';
import 'package:app_music/main/my_app.dart';

// Start app
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseService.instance.init();
  runApp(const MyApp());
}
