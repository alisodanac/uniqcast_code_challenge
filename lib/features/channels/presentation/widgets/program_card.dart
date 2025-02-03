import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uniqcast_code_challenge/core/managers/responsive_manager.dart/responsive_manager.dart';
import 'package:uniqcast_code_challenge/core/managers/theme_manager/app_colors.dart';
import 'package:uniqcast_code_challenge/core/managers/theme_manager/text_style.dart';
import 'package:uniqcast_code_challenge/features/channels/helpers/set_reminder.dart';
import 'package:uniqcast_code_challenge/features/channels/presentation/manager/channels_manager.dart';

class ProgramCard extends StatelessWidget {
  final String title;
  final String descripiton;
  final String time;
  final int programIndex;
  final DateTime programDateTime;

  const ProgramCard({
    super.key,
    required this.programIndex,
    required this.programDateTime,
    required this.title,
    required this.descripiton,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ExpansionTile(
        childrenPadding: EdgeInsets.symmetric(
          horizontal: 0.03.w(context),
          vertical: 0.01.h(context),
        ),
        showTrailingIcon: false,
        tilePadding: EdgeInsets.zero,
        title: Container(
          decoration: BoxDecoration(
            color: AppColors.card,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 0.01.h(context)),
            child: Row(
              children: [
                SizedBox(
                  width: 0.021.w(context),
                ),
                Container(
                  width: 0.01.w(context),
                  height: 0.1.h(context),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                SizedBox(
                  width: 0.02.w(context),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    time,
                    style: context.mediumBoldTextStyle,
                    textScaler: ScaleSize.textScaler(context),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: context.titleTextStyle,
                        textScaler: ScaleSize.textScaler(context),
                      ),
                    ],
                  ),
                ),
                programDateTime.isBefore(DateTime.now())
                    ? const IconButton(onPressed: null, icon: Icon(Icons.notification_add))
                    : Consumer(builder: (context, ref, _) {
                        final remindersRef = ref.watch(programsNamesWithReminder);
                        return IconButton(
                          onPressed: () {
                             final notifier = ref.read(programsNamesWithReminder.notifier);
                            if (programDateTime.isAfter(DateTime.now())) {
                              if (!ref.read(programsNamesWithReminder).contains(title)) {
                                SetReminder.set(time: time, title: title, programDateTime: programDateTime);
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Reminder set for $title")));
                                notifier.state = {...notifier.state, title};
                              } else {
                                notifier.state.remove(title);
                               notifier.state = {...notifier.state};
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Reminder to $title was canceled")));
                              }
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Program $title has already started")));
                            }
                          },
                          icon: const Icon(Icons.notification_add),
                          color: remindersRef.contains(title) ? AppColors.primary : Colors.white,
                        );
                      })
              ],
            ),
          ),
        ),
        children: [
          Column(
            children: [
              Row(
                children: [
                  Text(
                    "descripton :",
                    style: context.subtitleTextStyle,
                    textScaler: ScaleSize.textScaler(context),
                  ),
                ],
              ),
              SizedBox(
                height: 0.01.h(context),
              ),
              Text(
                descripiton,
                style: context.subtitleTextStyle,
                textAlign: TextAlign.start,
                textScaler: ScaleSize.textScaler(context),
              ),
            ],
          )
        ],
      ),
    );
  }
}
