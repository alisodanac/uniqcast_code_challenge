import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:uniqcast_code_challenge/core/errors/exception/exceptions.dart';
import 'package:uniqcast_code_challenge/core/errors/failures/failures.dart';
import 'package:uniqcast_code_challenge/core/managers/network_manager/network_info_manager.dart';
import 'package:uniqcast_code_challenge/features/channels/data/datasource/local/channels_local_datasource.dart';
import 'package:uniqcast_code_challenge/features/channels/data/datasource/remote/channels_remote_data_source.dart';
import 'package:uniqcast_code_challenge/features/channels/data/mappers/channels_to_entity_mapper.dart';
import 'package:uniqcast_code_challenge/features/channels/data/models/channel/channel_model.dart';
import 'package:uniqcast_code_challenge/features/channels/data/repository/channels_repository_imp.dart';
import 'package:uniqcast_code_challenge/features/channels/domain/entities/channel_entity.dart';
import 'package:collection/collection.dart';
import 'channels_repository_imp_test.mocks.dart'; 


@GenerateMocks([
  ChannelsRemoteDataSourceImp,
  ChannelsLocalDatasourceImp,
  NetworkInfoManager
])
void main(){
  late ChannelsRepositoryImp repository;
  late MockChannelsRemoteDataSourceImp mockRemoteDataSource;
  late MockChannelsLocalDatasourceImp mockLocalDataSource;
  late MockNetworkInfoManager mockNetworkInfo;


const deepEquality =  DeepCollectionEquality();

  setUp(() {
    mockRemoteDataSource = MockChannelsRemoteDataSourceImp();
    mockLocalDataSource = MockChannelsLocalDatasourceImp();
    mockNetworkInfo = MockNetworkInfoManager();

    repository = ChannelsRepositoryImp(
      channelsLocalDatasource: MockChannelsLocalDatasourceImp(),
      channelsRemoteDataSource: MockChannelsRemoteDataSourceImp(),
    );
    repository.channelsRemoteDataSource = mockRemoteDataSource;
    repository.channelsLocalDatasource = mockLocalDataSource;
    repository.networkInfoManager = mockNetworkInfo;
  });

  final List<ChannelModel> testChannelsModel = [
    ChannelModel(
      id: "1",
      name: "HBO",
      logo: "https://example.com/hbo.png",
      url: "http://hbo.com",
      programs: []
    ),
  ];

  final List<ChannelEntity> testChannelsEntity = testChannelsModel.map((e) => e.toEntity).toList();
    
    test('should return remote data when online', () async {
    when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
    when(mockRemoteDataSource.fetchEpgChannels()).thenAnswer((_) async => testChannelsModel);

    final result = await repository.getChannels();



  expect(deepEquality.equals(result.getOrElse(() => []), testChannelsEntity), isTrue);

    verify(mockRemoteDataSource.fetchEpgChannels());
    verify(mockLocalDataSource.saveChannels(testChannelsModel));
    verifyNoMoreInteractions(mockLocalDataSource);
  });
    
    test('should return NetworkFailure when NetworkException is thrown', () async {
    when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
    when(mockRemoteDataSource.fetchEpgChannels()).thenThrow(NetworkException());

    final result = await repository.getChannels();

    expect(result,const Left(NetworkFailure()));
  });

  test('should return cached data when offline', () async {
    when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
    when(mockLocalDataSource.retrieveChannels()).thenAnswer((_) async => testChannelsModel);

    final result = await repository.getChannels();

     expect(deepEquality.equals(result.getOrElse(() => []), testChannelsEntity), isTrue);
    verify(mockLocalDataSource.retrieveChannels());
  });

  test('should return EmptyCacheFailure when cache is empty', () async {
    when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
    when(mockLocalDataSource.retrieveChannels()).thenThrow(EmptyCacheException());

    final result = await repository.getChannels();
    expect(result, equals(const Left<Failure,List<ChannelEntity>>(EmptyCacheFailure())));
  });

}