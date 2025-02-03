import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uniqcast_code_challenge/core/managers/responsive_manager.dart/responsive_manager.dart';
import 'package:uniqcast_code_challenge/features/channels/presentation/manager/channels_manager.dart';

class ChannelsWidget extends ConsumerWidget {
  const ChannelsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final channelsAsync = ref.watch(
      channelsAndProgramsProvider.select((value) => value.valueOrNull ?? []),
    );

    return SizedBox(
      height: 0.065.h(context),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: channelsAsync.length,
          itemBuilder: (context, i) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 0.2.w(context)),
              child: GestureDetector(
                onTap: () => ref.watch(selectedChannelIndexProvider.notifier).state = i,
                child: CachedNetworkImage(
                  width: 0.18.w(context),
                  imageUrl: channelsAsync[i].logo,
                ),
              ),
            );
          }),
    );
  }
}
