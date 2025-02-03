
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uniqcast_code_challenge/core/service_locator/injection.dart';
import 'package:uniqcast_code_challenge/features/app.dart';
import 'package:uniqcast_code_challenge/features/channels/data/models/channel/channel_model.dart';
import 'package:uniqcast_code_challenge/features/channels/data/models/program/program_model.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:uniqcast_code_challenge/core/reminders/notifications_service.dart';

void main() async{
   WidgetsFlutterBinding.ensureInitialized();
  final app = App.instance();
   configureDependencies();
  await Hive.initFlutter();
  tz.initializeTimeZones();
  NotificationService.init(); 
  Hive.registerAdapter(ChannelModelAdapter());
  Hive.registerAdapter(ProgramModelAdapter());

 runApp(ProviderScope(child: app));
}


