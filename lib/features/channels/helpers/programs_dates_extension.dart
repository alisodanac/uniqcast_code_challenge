import 'package:uniqcast_code_challenge/core/extensions/date_time_extensions.dart';
import 'package:uniqcast_code_challenge/features/channels/domain/entities/program_entity.dart';

extension ProgramsDatesExtension on List<ProgramEntity> {
  Set<String> get dates => map((program) => program.startTime.toDates).toSet();
}