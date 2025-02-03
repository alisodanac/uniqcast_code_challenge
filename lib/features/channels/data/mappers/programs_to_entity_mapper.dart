import 'package:uniqcast_code_challenge/features/channels/data/models/program/program_model.dart';
import 'package:uniqcast_code_challenge/features/channels/domain/entities/program_entity.dart';

extension ProgramsToEntityMapper on ProgramModel {
  ProgramEntity get toEntity => ProgramEntity(
        channelId: channelId,
        startTime: startTime,
        endTime: endTime,
        title: title,
        description: description,
      );
}
