import 'dart:developer';

import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  final Object error;
  final StackTrace? stackTrace;
  const ErrorScreen({
    Key? key,
    required this.error,
    this.stackTrace,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log('error', stackTrace: stackTrace);
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('$error'),
          ],
        ),
      ),
    );
  }
}
