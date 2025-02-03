import 'package:flutter/material.dart';


/// Widget that displays an empty list message.
/// use it when you need to display an empty list
class EmptyListWidget extends StatelessWidget {
  const EmptyListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
         Icon(Icons.tv_off, size: 80, color: Colors.grey.shade400), // TV Off Icon
          SizedBox(height: 16),
          Text(
            'No Programs Found',
            style: TextStyle(fontSize: 18, color: Colors.grey.shade600),
            textAlign: TextAlign.center,
          ),
      ],
    );
  }
}