import 'package:court_mate/app.dart';
import 'package:court_mate/features/reservation/data/models/reservation_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter((await getApplicationDocumentsDirectory()).path);
  Hive.registerAdapter(ReservationModelAdapter());
  await Hive.openBox<ReservationModel>('reservations');
  runApp(const ProviderScope(
    child: MyApp(),
  ));
}
