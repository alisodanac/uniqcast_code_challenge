import 'package:dartz/dartz.dart';
import 'package:uniqcast_code_challenge/core/errors/failures/failures.dart';
import 'package:uniqcast_code_challenge/features/channels/domain/entities/channel_entity.dart';


abstract class ChannelsRepository {
  Future<Either<Failure,List<ChannelEntity>>> getChannels();
}