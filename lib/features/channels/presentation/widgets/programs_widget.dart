import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uniqcast_code_challenge/core/common_widgets/empty_lists/empty_list_widget.dart';
import 'package:uniqcast_code_challenge/core/extensions/date_time_extensions.dart';
import 'package:uniqcast_code_challenge/features/channels/presentation/manager/channels_manager.dart';
import 'package:uniqcast_code_challenge/features/channels/presentation/widgets/program_card.dart';

class ProgramsWidget extends HookConsumerWidget {
  const ProgramsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final channels = ref.watch(
      channelsAndProgramsProvider.select((value) => value.valueOrNull ?? []),
    );
    final selectedChannelIndex = ref.watch(selectedChannelIndexProvider.select((value) => value));
    final selectedProgramsDateProvider = ref.watch(selectedProgramsDate.select((value) => value));
    final programs = channels[selectedChannelIndex].programs.where((e) => e.startTime.toDates == selectedProgramsDateProvider).toList();
    
    return Expanded(
      child: programs.isEmpty
          ? const EmptyListWidget()
          : ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            itemCount: programs.length,
            itemBuilder: (context, int i) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ProgramCard(
                programIndex: i,
                programDateTime: programs[i].startTime,
                title: programs[i].title,
                time: programs[i].startTime.toHours,
                descripiton: programs[i].description,
              ),
            ),
          ),
    );
  }
}
