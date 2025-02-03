import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uniqcast_code_challenge/core/common_widgets/error_widget/error_widget.dart';
import 'package:uniqcast_code_challenge/core/common_widgets/loading_widget/loading_widget.dart';
import 'package:uniqcast_code_challenge/features/channels/presentation/manager/channels_manager.dart';
import 'package:uniqcast_code_challenge/features/channels/presentation/widgets/channels_widget.dart';
import 'package:uniqcast_code_challenge/features/channels/presentation/widgets/programs_dates_widget.dart';
import 'package:uniqcast_code_challenge/features/channels/presentation/widgets/programs_widget.dart';

class ChannelsPage extends HookConsumerWidget {
  const ChannelsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(channelsAndProgramsProvider);
    return Scaffold(
      body: SafeArea(
        child: asyncValue.when(
            data: (data) => const Column(
                  children: [
                    ChannelsWidget(),
                    ProgramsDatesWidget(),
                    ProgramsWidget(),
                  ],
                ),
            error: (e, s) => AppErrorWidget(
                  failureMessage: e.toString(),
                  onRetryButtonPressed: () => ref.refresh(channelsAndProgramsProvider),
                ),
            loading: () => const AppLoadingWidget()),
      ),
    );
  }
}
