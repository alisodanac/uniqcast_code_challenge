import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:uniqcast_code_challenge/core/errors/failures/failures.dart';
import 'package:uniqcast_code_challenge/features/channels/domain/entities/channel_entity.dart';
import 'package:uniqcast_code_challenge/features/channels/domain/repository/channels_repository.dart';


@singleton
class GetChannelsUsecase {
  GetChannelsUsecase(this._channelsRepository);
  final ChannelsRepository _channelsRepository ;
  Future <Either<Failure,List<ChannelEntity>>>call()async{
    return await _channelsRepository.getChannels();
  }
}