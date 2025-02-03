import 'package:equatable/equatable.dart';

class ProgramEntity extends Equatable {
  final String channelId;
  final DateTime startTime;
  final DateTime endTime;
  final String title;
  final String description;

   const ProgramEntity({
    required this.channelId,
    required this.startTime,
    required this.endTime,
    required this.title,
    required this.description,
  });

  @override
  List<Object?> get props => [
        channelId,
        startTime.millisecondsSinceEpoch,
        endTime.millisecondsSinceEpoch,
        title,
        description,
        
      ];
}
