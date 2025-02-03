import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:uniqcast_code_challenge/core/errors/exception/exceptions.dart';
import 'package:uniqcast_code_challenge/core/errors/failures/failures.dart';
import 'package:uniqcast_code_challenge/core/managers/network_manager/network_info_manager.dart';
import 'package:uniqcast_code_challenge/features/channels/data/datasource/local/channels_local_datasource.dart';
import 'package:uniqcast_code_challenge/features/channels/data/datasource/remote/channels_remote_data_source.dart';
import 'package:uniqcast_code_challenge/features/channels/domain/entities/channel_entity.dart';
import 'package:uniqcast_code_challenge/features/channels/domain/repository/channels_repository.dart';
import 'package:uniqcast_code_challenge/features/channels/data/mappers/channels_to_entity_mapper.dart';
/// Implementation of [ChannelsRepository] that handles retrieving TV channel data
/// from both remote and local data sources.
///
/// This repository follows a network-first approach:
/// - If the device is connected to the internet, it fetches the channels from a remote source
///   and caches them locally.
/// - If the device is offline, it retrieves the cached data from a local source.
///
/// Errors are handled gracefully, returning appropriate [Failure] instances
/// in case of network issues, server errors, or empty cache scenarios.
@Singleton(as: ChannelsRepository)
class ChannelsRepositoryImp extends ChannelsRepository {
  // Data source responsible for fetching TV channels from a remote API.
  ChannelsRemoteDataSource channelsRemoteDataSource ;

  /// Data source responsible for caching and retrieving TV channels locally.
  ChannelsLocalDatasource channelsLocalDatasource ;
  /// Manages network connectivity status.
  NetworkInfoManager networkInfoManager = NetworkInfoManagerImpl.instance;
  ChannelsRepositoryImp ({required this.channelsRemoteDataSource,required this.channelsLocalDatasource,});
  @override
  // Retrieves a list of TV channels.
  ///
  /// This method first checks if the device is online:
  /// - If **online**, it fetches the channels from [channelsRemoteDataSource],
  ///   stores them in the local cache, and returns them.
  /// - If **offline**, it retrieves channels from [channelsLocalDatasource].
  ///
  /// **Failure Handling:**
  /// - If a **network issue** occurs → returns [NetworkFailure].
  /// - If a **server issue** occurs → returns [ServerFailure].
  /// - If the **fetched data is incorrect** → returns [WrongDataFailure].
  /// - If an **unexpected error** occurs → returns [UnknownFailure].
  /// - If retrieving local data fails due to an **empty cache** → returns [EmptyCacheFailure].
  ///
  /// **Returns:**
  /// - `Right(List<ChannelEntity>)` on success.
  /// - `Left(Failure)` on failure.
  Future<Either<Failure, List<ChannelEntity>>> getChannels() async {
    if (await networkInfoManager.isConnected) {
      try {
        final channels = await channelsRemoteDataSource.fetchEpgChannels();
        channelsLocalDatasource.saveChannels(channels);
        return Right(channels.toEntityList);
      } on NetworkException {
        return const Left(NetworkFailure());
      } on ServerException {
        return const Left(ServerFailure());
      } on WrongDataException {
        return const Left(WrongDataFailure());
      } on UnknownException {
        return const Left(UnknownFailure());
      } catch (e) {
        return const Left(UnknownFailure());
      }
    } else {
      try {
        final localChannels = await channelsLocalDatasource.retrieveChannels();
        return Right(localChannels.toEntityList);
      } on EmptyCacheException {
        return const Left(EmptyCacheFailure());
      } catch (e) {
        return const Left(UnknownFailure());
      }
    }
  }

}
