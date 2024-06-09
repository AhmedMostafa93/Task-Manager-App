import 'package:flutter/material.dart';

class LoadingOverlay extends StatelessWidget {
  final bool isLoading;
  final Widget child;

  LoadingOverlay({required this.isLoading, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (isLoading)
          Container(
            color: Colors.black54, // Semi-transparent background
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
      ],
    );
  }
}
