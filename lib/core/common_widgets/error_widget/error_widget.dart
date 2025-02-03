import 'package:flutter/material.dart';
import 'package:uniqcast_code_challenge/core/managers/responsive_manager.dart/responsive_manager.dart';


/// Widget that displays an error message and a button to retry.
/// use it to display an error
class AppErrorWidget extends StatelessWidget {
  const AppErrorWidget({
    super.key,
    required this.failureMessage,
    required this.onRetryButtonPressed
  });
  final String failureMessage;

  final void Function()? onRetryButtonPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(failureMessage),
          SizedBox(
            height: 0.01.h(context),
          ),
          ElevatedButton(onPressed: onRetryButtonPressed, child: Text("Retry"))
        ],
      ),
    );
  }
}
