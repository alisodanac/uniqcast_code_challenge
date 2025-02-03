import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uniqcast_code_challenge/features/channels/data/models/program/program_model.dart';
import 'package:hive/hive.dart';
part 'channel_model.freezed.dart';
part 'channel_model.g.dart';

@HiveType(typeId: 0)
@freezed
class ChannelModel with _$ChannelModel {
  factory ChannelModel({
    @HiveField(0)
    required String id,
     @HiveField(1)
    required String name,
      @HiveField(2)
    required String logo,
      @HiveField(3)
    required String url,
     @HiveField(4)
    @Default([]) List<ProgramModel> programs,
  }) = _ChannelModel;

  factory ChannelModel.fromJson(Map<String, dynamic> json) => _$ChannelModelFromJson(json);

 
}
