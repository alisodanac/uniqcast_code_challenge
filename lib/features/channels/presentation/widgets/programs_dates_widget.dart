import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uniqcast_code_challenge/core/managers/responsive_manager.dart/responsive_manager.dart';
import 'package:uniqcast_code_challenge/core/managers/theme_manager/app_colors.dart';
import 'package:uniqcast_code_challenge/core/managers/theme_manager/text_style.dart';
import 'package:uniqcast_code_challenge/features/channels/helpers/programs_dates_extension.dart';
import 'package:uniqcast_code_challenge/features/channels/presentation/manager/channels_manager.dart';

class ProgramsDatesWidget extends ConsumerWidget {
  const ProgramsDatesWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final channels = ref.watch(
      channelsAndProgramsProvider.select((value) => value.valueOrNull ?? []),
    );
    final selectedChannelProgram = ref.watch(selectedChannelIndexProvider.select((value) => value));

    return SizedBox(
        height: 0.1.h(context),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: channels[selectedChannelProgram]
                .programs
                .dates
                .map((e) => SizedBox(
                      width: 0.3.w(context),
                      child: TextButton(
                        child: Text(
                          e,
                          style: ref.watch(selectedProgramsDate) == e 
                          ? context.lableTextStyle.copyWith(color: AppColors.primary) : context.lableTextStyle.copyWith(),
                          textScaler: ScaleSize.textScaler(
                            context,
                          ),
                        ),
                        onPressed: () => ref.watch(selectedProgramsDate.notifier).state = e,
                      ),
                    ))
                .toList(),
          ),
        ));
  }
}
