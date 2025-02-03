// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:io' as _i497;

import 'package:get_it/get_it.dart' as _i174;
import 'package:hive/hive.dart' as _i979;
import 'package:hive_flutter/hive_flutter.dart' as _i986;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/channels/data/datasource/local/channels_local_datasource.dart'
    as _i204;
import '../../features/channels/data/datasource/remote/channels_remote_data_source.dart'
    as _i941;
import '../../features/channels/data/datasource/remote/xml_parser.dart'
    as _i636;
import '../../features/channels/data/repository/channels_repository_imp.dart'
    as _i881;
import '../../features/channels/domain/repository/channels_repository.dart'
    as _i1013;
import '../../features/channels/domain/usecases/get_channels_usecase.dart'
    as _i310;
import 'injection_module.dart' as _i212;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final injectionModule = _$InjectionModule();
    gh.lazySingleton<_i497.HttpClient>(
        () => injectionModule.provideHttpClient());
    gh.lazySingleton<_i636.XmlEpgParser>(
        () => injectionModule.provideXmlEpgParser());
    gh.lazySingleton<_i986.HiveInterface>(
        () => injectionModule.provideHiveInterface());
    gh.singleton<_i204.ChannelsLocalDatasource>(() =>
        _i204.ChannelsLocalDatasourceImp(hive: gh<_i979.HiveInterface>()));
    gh.singleton<_i941.ChannelsRemoteDataSource>(
        () => _i941.ChannelsRemoteDataSourceImp(
              xmlEpgParser: gh<_i636.XmlEpgParser>(),
              httpClient: gh<_i497.HttpClient>(),
            ));
    gh.singleton<_i1013.ChannelsRepository>(() => _i881.ChannelsRepositoryImp(
          channelsRemoteDataSource: gh<_i941.ChannelsRemoteDataSource>(),
          channelsLocalDatasource: gh<_i204.ChannelsLocalDatasource>(),
        ));
    gh.singleton<_i310.GetChannelsUsecase>(
        () => _i310.GetChannelsUsecase(gh<_i1013.ChannelsRepository>()));
    return this;
  }
}

class _$InjectionModule extends _i212.InjectionModule {}
