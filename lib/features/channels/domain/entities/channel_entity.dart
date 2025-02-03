

import 'package:equatable/equatable.dart';
import 'package:uniqcast_code_challenge/features/channels/domain/entities/program_entity.dart';

class ChannelEntity extends Equatable {
  final String id;
  final String name;
  final String logo;
  final String url;
  final List<ProgramEntity>programs;

  const ChannelEntity({
    required this.id,
    required this.name,
    required this.logo,
    required this.url,
    required this.programs,
  });
  
  @override
  List<Object?> get props => [
    id,
    name,
    logo,
    url,
    programs,
  ];
  }
