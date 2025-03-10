import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:recipe_app/app/app.dart';
import 'package:recipe_app/app/di/di.dart';
import 'package:recipe_app/core/network/hive_service.dart';
import 'package:recipe_app/feature/Product/data/model/product_hive_model.dart';
import 'package:recipe_app/feature/auth/data/model/auth_hive_model.dart';
import 'package:recipe_app/feature/order/data/model/order_hive_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Hive.registerAdapter(AuthHiveModelAdapter());
  Hive.registerAdapter(ProductHiveModelAdapter());
  Hive.registerAdapter(OrderHiveModelAdapter());
  await HiveService().init();
  await initDependencies();

  runApp(
    const MyApp(),
  );
}
