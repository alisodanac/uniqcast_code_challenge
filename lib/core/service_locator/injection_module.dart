import 'dart:io';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:uniqcast_code_challenge/features/channels/data/datasource/remote/xml_parser.dart';

@module
abstract class InjectionModule {
  @lazySingleton
  HttpClient provideHttpClient() => HttpClient();

  @lazySingleton
  XmlEpgParser provideXmlEpgParser() => XmlEpgParser();

  @lazySingleton
  HiveInterface provideHiveInterface() => Hive;
  
}