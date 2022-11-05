import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: SyncFit()));
}

class SyncFit extends StatelessWidget {
  const SyncFit({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Sync Fit',
    );
  }
}
