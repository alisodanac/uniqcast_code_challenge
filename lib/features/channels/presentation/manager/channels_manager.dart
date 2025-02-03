import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uniqcast_code_challenge/core/service_locator/injection.dart';
import 'package:uniqcast_code_challenge/features/channels/domain/entities/channel_entity.dart';
import 'package:uniqcast_code_challenge/features/channels/domain/usecases/get_channels_usecase.dart';
part 'channels_manager.g.dart';

@riverpod
  /// Returns a list of [ChannelEntity] which includes programs. The function
  /// does not filter out programs based on the selected date.
  ///
  /// The function throws a [Failure] if the use case fails.
Future<List<ChannelEntity>> channelsAndPrograms(Ref ref) async {
  GetChannelsUsecase getChannelsUsecase = getIt<GetChannelsUsecase>();
  final channelsAndPrograms = await getChannelsUsecase();
  final result = channelsAndPrograms.fold((failure) => throw failure.message, (channels) => channels);
  return result;
}

final selectedChannelIndexProvider = StateProvider<int>((ref) => 0);

final selectedProgramsDate = StateProvider<String>((ref) => 'Today');

final programsNamesWithReminder = StateProvider<Set<String>>((ref) => {});