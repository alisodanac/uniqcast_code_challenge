import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
part 'program_model.freezed.dart';
part 'program_model.g.dart';

@HiveType(typeId: 1)
@freezed
class ProgramModel with _$ProgramModel {
  factory ProgramModel(
      {@HiveField(0) required String channelId,
      @HiveField(1) required DateTime startTime,
      @HiveField(2) required DateTime endTime,
      @HiveField(3) required String title,
      @HiveField(4) required String description}) = _ProgramModel;

  factory ProgramModel.fromJson(Map<String, dynamic> json) => _$ProgramModelFromJson(json);
}
