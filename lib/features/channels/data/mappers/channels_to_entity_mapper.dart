import 'package:uniqcast_code_challenge/features/channels/data/models/channel/channel_model.dart';
import 'package:uniqcast_code_challenge/features/channels/domain/entities/channel_entity.dart';
import 'package:uniqcast_code_challenge/features/channels/data/mappers/programs_to_entity_mapper.dart';


/// use this mapper when you need to convert a single [ChannelModel] to [ChannelEntity]
extension ChannelsToEntityMapper on ChannelModel {
  ChannelEntity get toEntity => ChannelEntity(
        id: id,
        name: name,
        logo: logo,
        url: url,
        programs: programs.map((program) => program.toEntity).toList(),
      );
}

/// use this mapper when you need to convert a List of [ChannelModel] to [ChannelEntity]

extension ChannelsToEntityListMapper on List<ChannelModel> {
  List<ChannelEntity> get toEntityList => map((channel) => channel.toEntity).toList();
}
